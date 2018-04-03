# Timeout

In this Lab you wil lean how to induce timeout for a service as part of Istio Service Mesh.  With timeout set the service mesh will return failure if it does not get response within **N** seconds.

## What you will learn

How to handle timeout with services that are deployed in Istio Service Mesh.

## Step 1

At this point, no other route rules should be in effect. `oc get routerules` and `oc delete routerule <rulename>` if there are some.

## Step 2

Change the configuration of `recommendation` service to use the docker image `recommendation:L5-v2` which has the time simulation code.

```sh
CONTAINER_NAME="recommendation"
IMAGE="recommendation:v2d"
oc patch deployment recommendation -p "{\"spec\":{\"template\":{\"spec\":{\"containers\":[{\"name\":\"${CONTAINER_NAME}\",\"image\":\"${IMAGE}\"}]}}}}"
```

## Step 3

Apply  the istio time rule `istioctl create -f istiofiles/route-rule-recommendation-timeout.yml -n istio-lab`

## Step 4

Verify if timeout is happening as expected 

```sh
#!/bin/bash
while true
do
time curl customer-istio-lab.$(minishift ip).nip.io
sleep .1
done
```

You will see it return v1 OR "upstream request timeout" after waiting about 1 second

```sh
customer => 503 preference => 504 upstream request timeout
curl customer-istio-lab.$(minishift ip).nip.io  0.01s user 0.00s system 0% cpu 1.035 total
customer => preference => recommendation v1 from '2039379827-h58vw': 210
curl customer-istio-lab.$(minishift ip).nip.io  0.01s user 0.00s system 36% cpu 0.025 total
customer => 503 preference => 504 upstream request timeout
curl customer-istio-lab.$(minishift ip).nip.io  0.01s user 0.00s system 0% cpu 1.034 total
```

## Cleanup 

Let's now clean up the timeout istio rule

`istioctl delete routerule recommendation-timeout -n istio-lab`

# Congratulations

Congratulations you have successfully learnt how to create and apply an Istio Timeout Route Rule.

# References

* [Istio Homepage](https://istio.io)
* [Red Hat OpenShift](https://openshift.com)
* [Learn Istio on OpenShift](https://learn.openshift.com/servicemesh)
