# Introduction and Setup

![Istio Logo]({% image_path istio-logo.png %})

Istio is an open platform to connect, manage, and secure microservices. Istio provides an easy way to create a network of deployed services with load balancing, service-to-service authentication, monitoring, and more, without requiring any changes in service code. You add Istio support to services by deploying a special sidecar proxy throughout your environment that intercepts all network communication between microservices, configured and managed using Istio’s control plane functionality.

Follow the steps below to get started with this lab!

### Fetch connect script

First, open a terminal and run the following commands:

~~~sh
cd
wget https://raw.githubusercontent.com/jamesfalkner/istio-lab-summit-2018/master/scripts/connect.sh
~~~

### Find your hostname

Your hostname for this lab is `{{ISTIO_LAB_HOSTNAME}}`.

### Execute connect script

To connect to your provisioned lab machine, run the following command:

~~~sh
bash connect.sh {{ISTIO_LAB_HOSTNAME}} ~/.ssh/summit_lab_rsa
~~~

Your lab environment pre-defines several environment variables and adds Istio your `$PATH`. Confirm they
are set correctly:

~~~bash
echo Istio Home: $ISTIO_HOME && \
echo Istio Lab Content: $ISTIO_LAB_HOME && \
echo Istio Lab Content: $ISTIO_LAB_HOME && \
echo Istio Lab Project Name: $ISTIO_LAB_PROJECT && \
echo Path: $PATH
~~~

### Start OpenShift and install Istio

~~~sh
sudo -E -i
cd $ISTIO_LAB_HOME
./scripts/start.sh
~~~

After the start script completes, you are ready to move on to the first exercise! Good luck!

### Opening more Terminals

If you need to open up more terminal windows during the lab, you'll again need
to use `ssh` to connect to the environment before executing commands in the exercises:

~~~bash
bash connect.sh {{ISTIO_LAB_HOSTNAME}} ~/.ssh/summit_lab_rsa
~~~

Then:

~~~bash
sudo -E -i
cd $ISTIO_LAB_HOME
~~~

## Congratulations!

In the next step we'll use Istio to intelligently route traffic. Click **Go To Next Module** to continue!