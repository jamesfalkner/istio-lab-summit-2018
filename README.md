# Getting Hands On With Istio on OpenShift
## Red Hat Summit 2018

As microservices-based applications become more prevalent, both the number of and complexity of their interactions increases. Up until now much of the burden of managing these complex microservices interactions has been placed on the application developer, with different or non-existent support for microservice concepts depending on language and framework. The service mesh concept pushes this responsibility to the infrastructure, with features for traffic management, distributed tracing and observability, policy enforcement, and service/identity security, freeing the developer to focus on business value. In this hands-on session you will learn how to apply some of these features to a simple polyglot microservices application running on top of OpenShift using Istio, an open platform to connect, manage, and secure microservices.

**Table of Contents**

* [Prerequisites](#prereqs)
* [Setup Environment](#setup-environment)
* [Introduction](instructions/00-intro.md)
* [Lab 1 - Basic Routing](instructions/01-basic-routing.md)
* [Lab 2 - Service Visualization and Tracing Console](instructions/02-graph-and-tracing.md)
* [Lab 3 - Fault Injection](instructions/03-fault-injection.md)
* [Lab 4 - Rate Limiting](instructions/04-rate-limiting.md)
* [Lab 5 - Timeouts](instructions/05-timeouts.md)
* [Lab 6 - Whitelisting](instructions/06-whitelisting.md)
* [Lab 7 - Blacklisting](instructions/07-blacklisting.md)
* [Lab 8 - Extra Credit](instructions/08-extra-credit.md)

## Prerequisites

Working knowledge of programming (e.g. Developer, Architect)
Familiarity with containers and OpenShift

## Setup Environment

You will be provisioned your own machine with OpenShift pre-installed, along with the necessary tooling to complete the labs.

To setup your environment, simply run this command to log into the machine:

```bash
curl -kL https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh | \
  bash /dev/stdin $(hostname)
```

You may need to supply a key to use, in which case:

~/ws/istio-lab-summit-2018/scripts/connect.sh  openshift-d2f1.rhpds.opentlc.com ~/Downloads/summit_lab_rsa

```bash
curl -kL https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh | \
  bash /dev/stdin $(hostname) PATH_TO_RSA_KEY
```

Let's set a few environment variables to use later on and add the istio CLI tools
to our `$PATH`:

```bash
export ISTIO_HOME=/opt/lab/istio-0.6.0
export ISTIO_LAB_HOME=/opt/lab/istio-lab-summit-2018
export ISTIO_LAB_PROJECT=istio-lab
export PATH=${PATH}:${ISTIO_HOME}/bin
```

Once connected, run the following commands:

```bash
sudo -E -i
$ISTIO_LAB_HOME/scripts/start.sh
```

This script will startup OpenShift and leave you at a command prompt, ready to start the labs.

<div>
 <div style="float: left"><span>&nbsp;</span></div>
<div style="float: right"><a href="./instructions/00-intro.md"><span>>></span></a></div>
<div>