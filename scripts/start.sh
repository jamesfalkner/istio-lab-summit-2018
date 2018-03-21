#!/bin/bash
oc cluster up --public-hostname="$LC_MYIP" \
  --routing-suffix="$LC_MYIP.xip.io" \
  --use-existing-config \
  --host-data-dir=/var/lib/origin/openshift.local.data

#curl -L https://github.com/istio/istio/releases/download/0.6.0/istio-0.6.0-osx.tar.gz | tar xz
cd /opt/lab/istio-0.6.0
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin developer
oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z default -n istio-system
oc adm policy add-scc-to-user anyuid -z grafana -n istio-system
oc adm policy add-scc-to-user anyuid -z prometheus -n istio-system
oc create -f install/kubernetes/istio.yaml
oc project istio-system
oc expose svc istio-ingress
oc apply -f install/kubernetes/addons/prometheus.yaml
oc apply -f install/kubernetes/addons/grafana.yaml
oc apply -f install/kubernetes/addons/servicegraph.yaml
oc expose svc servicegraph
oc expose svc grafana
oc expose svc prometheus
oc process -f https://raw.githubusercontent.com/jaegertracing/jaeger-openshift/master/all-in-one/jaeger-all-in-one-template.yml | oc create -f -

