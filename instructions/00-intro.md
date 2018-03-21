## Introduction

Istio is cool.

![Istio Logo](imgs/istio-logo.png "Istio Logo")

### Fetch connect script

    cd
    wget https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh

### Find your hostname

**picture of the link to click**

**picture of the hostname**

### Execute connect script

    bash connect.sh openshift-e119.rhpds.opentlc.com ~/.ssh/summit_lab_rsa

### Start OpenShift and install Istio

    sudo -E -i
    cd /opt/lab/istio-lab-summit-2018
    ./scripts/start.sh
