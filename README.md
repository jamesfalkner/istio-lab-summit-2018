# Red Hat Summit 2018: <br/>Getting Hands On With Istio on OpenShift

Lab guides for the Getting Hands On With Istio on OpenShift at Red Hat Summit 2018

## Purpose

As microservices-based applications become more prevalent, both the number of and complexity of
their interactions increases. Up until now much of the burden of managing these complex
microservices interactions has been placed on the application developer, with different or
non-existent support for microservice concepts depending on language and framework.

The service mesh concept pushes this responsibility to the infrastructure, with features for
traffic management, distributed tracing and observability, policy enforcement, and
service/identity security, freeing the developer to focus on business value. In this hands-on
session you will learn how to apply some of these features to a simple polyglot microservices
application running on top of OpenShift using Istio, an open platform to connect, manage, and
secure microservices.

## Deploy On OpenShift

You can deploy the lab guides as a container image anywhere but most conveniently, you can deploy it on OpenShift Online or other OpenShift flavours:

```
oc new-project guides
oc new-app osevg/workshopper --name=istio-workshop \
      -e CONTENT_URL_PREFIX=https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions
      -e WORKSHOPS_URLS="https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions/_rhsummit18.yml" \
      -e JAVA_APP=false \
      -e OPENSHIFT_MASTER="http://127.0.0.1:8443" \
      -e APPS_SUFFIX="apps.127.0.0.1.nip.io" \
      -e ISTIO_LAB_HOSTNAME="127.0.0.1"

oc expose svc/istio-workshop
```

Replace `OPENSHIFT_MASTER` with the URL to your working OpenShift master (e.g. `http://127.0.0.1:8443`), `APPS_SUFFIX` with your
default routing suffix (e.g. `apps.127.0.0.1.nip.io`), and `ISTIO_LAB_HOSTNAME` with the public hostname
of your machine. These variables are used to subsitute values in the markdown content files.

The guides can then be accessed at `http://istio-workshop-guides.$APPS_SUFFIX`.

The lab content (`.md` files) will be pulled from the GitHub when users access the guides in
their browser.

Note that the workshop variables can be overriden via specifying environment variables on the container itself e.g. the `JAVA_APP` env var in the above command

## Test Locally with Docker

You can directly run Workshopper as a docker container which is specially helpful when writing the content.
```
docker run -p 8080:8080 -v $(pwd):/app-data \
              -e CONTENT_URL_PREFIX="file:///app-data/instructions" \
              -e WORKSHOPS_URLS="file:///app-data/instructions/_rhsummit18.yml" \
              -e OPENSHIFT_MASTER="foo" \
              -e APPS_SUFFIX="$MY_IP.xip.io" \
              -e ISTIO_LAB_HOSTNAME="MY_HOSTNAME" \
              osevg/workshopper:latest
```

Replace `OPENSHIFT_MASTER` with the URL to your working OpenShift master (e.g. `http://127.0.0.1:8443`), `APPS_SUFFIX` with your
default routing suffix (e.g. `apps.127.0.0.1.nip.io`), and `ISTIO_LAB_HOSTNAME` with the public hostname
of your machine. These variables are used to subsitute values in the markdown content files.

Go to http://localhost:8080 on your browser to see the rendered workshop content. You can modify the lab instructions
and refresh the page to see the latest changes.

