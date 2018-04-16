<div>
 <div style="float: left"><a href="../README.md"><span>&lt;&lt;&nbsp;Previous</span></a></div>
<div style="float: right"><a href="./01-basic-routing.md"><span>Next&nbsp;&gt;&gt;</span></a></div>
<div>
<br/>

# Introduction

<p align="center">
<a href="https://istio.io"><img src="imgs/istio-logo.png" alt="Istio"/></a></p> 

An open platform to connect, manage, and secure microservices. Istio provides an easy way to create a network of deployed services with load balancing, service-to-service authentication, monitoring, and more, without requiring any changes in service code. You add Istio support to services by deploying a special sidecar proxy throughout your environment that intercepts all network communication between microservices, configured and managed using Istio’s control plane functionality.

### Fetch connect script

First, open a terminal and run the following commands:

```sh
cd
wget https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh
```

### Find your hostname

**picture of the link to click**

**picture of the hostname**

### Execute connect script
```sh
bash connect.sh openshift-xxxx.rhpds.opentlc.com ~/.ssh/summit_lab_rsa
```

Your lab environment pre-defines several environment variables and adds Istio your `$PATH`. Confirm they
are set correctly:

```bash
echo Istio Home: $ISTIO_HOME
echo Istio Lab Content: $ISTIO_LAB_HOME
echo Istio Lab Project Name: $ISTIO_LAB_PROJECT
echo Path: $PATH
```

### Start OpenShift and install Istio

```sh
sudo -E -i
cd $ISTIO_LAB_HOME
./scripts/start.sh
```

After the start script completes, you are ready to move on to the first exercise! Good luck!

### Opening more Terminals

If you need to open up more terminal windows during the lab, you'll again need
to use `ssh` to connect to the environment before executing commands in the exercises:

```bash
bash connect.sh openshift-xxxx.rhpds.opentlc.com ~/.ssh/summit_lab_rsa
```

Then:

```bash
sudo -E -i
cd $ISTIO_LAB_HOME
```


<div>
 <div style="float: left"><a href="../README.md"><span>&lt;&lt;&nbsp;Previous</span></a></div>
<div style="float: right"><a href="./01-basic-routing.md"><span>Next&nbsp;&gt;&gt;</span></a></div>
<div>

