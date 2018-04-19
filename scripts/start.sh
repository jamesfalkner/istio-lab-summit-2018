#!/bin/bash
# increase max vm memory map space (see https://github.com/openshift-istio/origin/issues/4)
sysctl vm.max_map_count=262144

oc cluster up --istio \
  --public-hostname="$LC_MYIP" \
  --routing-suffix="$LC_MYIP.xip.io" \
  --use-existing-config \
  --host-data-dir=/var/lib/origin/openshift.local.data

oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin admin
oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system

# add servicegraph
cat <<EOF | oc create -n istio-system -f -
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: servicegraph
  namespace: istio-system
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: servicegraph
      annotations:
        sidecar.istio.io/inject: "false"
    spec:
      containers:
      - name: servicegraph
        image: docker.io/istio/servicegraph:0.7.1
        imagePullPolicy: IfNotPresent
        ports:
          - containerPort: 8088
        args:
        - --prometheusAddr=http://prometheus:9090
---
apiVersion: v1
kind: Service
metadata:
  name: servicegraph
  namespace: istio-system
spec:
  ports:
  - name: http
    port: 8088
  selector:
    app: servicegraph
---
EOF

oc expose svc/servicegraph -n istio-system

# deploy workshopper guides
oc new-project guides
oc new-app osevg/workshopper --name=istio-workshop \
      -e CONTENT_URL_PREFIX=https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions \
      -e WORKSHOPS_URLS="https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions/_rhsummit18.yml" \
      -e JAVA_APP=false \
      -e OPENSHIFT_MASTER="https://$LC_MYIP:8443" \
      -e APPS_SUFFIX="$LC_MYIP.xip.io" \
      -e ISTIO_LAB_HOSTNAME="$(hostname)"

oc expose svc/istio-workshop
echo
echo "--------------------"
echo "Setup complete. Open the Lab Instructions in your browser: http://istio-workshop-guides.$LC_MYIP.xip.io"
echo "--------------------"
echo
