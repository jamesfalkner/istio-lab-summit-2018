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
oc new-app osevg/workshopper --name=istio-workshop-guide \
      -e CONTENT_URL_PREFIX=https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions
      -e WORKSHOPS_URLS="https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/instructions/_rhsummit18.yml" \
      -e JAVA_APP=false
oc expose svc/istio-workshop-guide
```

The lab content (`.md` files) will be pulled from the GitHub when users access the guides in
their browser.

Note that the workshop variables can be overriden via specifying environment variables on the container itself e.g. the `JAVA_APP` env var in the above command

## Test Locally with Docker

You can directly run Workshopper as a docker container which is specially helpful when writing the content.
```
docker run -p 8080:8080 -v $(pwd):/app-data \
              -e CONTENT_URL_PREFIX="file:///app-data/instructions" \
              -e WORKSHOPS_URLS="file:///app-data/instructions/_rhsummit18.yml" \
              osevg/workshopper:latest
```

Go to http://localhost:8080 on your browser to see the rendered workshop content. You can modify the lab instructions
and refresh the page to see the latest changes.

