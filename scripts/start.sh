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
