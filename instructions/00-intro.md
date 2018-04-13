<div>
 <div style="float: left"><a href="../README.md"><span><<</span></a></div>
<div style="float: right"><a href="./01-basic-routing.md"><span>>></span></a></div>
<div>
<br/>

# Introduction

<p align="center">
<a href="https://istio.io"><img src="imgs/istio-logo.png" alt="Istio"/></a></p> 

An open platform to connect, manage, and secure microservices. Istio provides an easy way to create a network of deployed services with load balancing, service-to-service authentication, monitoring, and more, without requiring any changes in service code. You add Istio support to services by deploying a special sidecar proxy throughout your environment that intercepts all network communication between microservices, configured and managed using Istio’s control plane functionality.

### Fetch connect script
```sh
cd
wget https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh
```

### Find your hostname

**picture of the link to click**

**picture of the hostname**

### Execute connect script
```sh
bash connect.sh openshift-e119.rhpds.opentlc.com ~/.ssh/summit_lab_rsa
```

### Start OpenShift and install Istio
```sh
sudo -E -i
cd /opt/lab/istio-lab-summit-2018
./scripts/start.sh
```
<div>
 <div style="float: left"><a href="../README.md"><span><<</span></a></div>
<div style="float: right"><a href="./01-basic-routing.md"><span>>></span></a></div>
<div>