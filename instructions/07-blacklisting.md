# Access Control - Blacklisting

In this lab we will learn how to **Blacklist** a service i.e. to make one service inaccessible to other service(s) within the service mesh.

## What you will learn

* Define **Blacklist** access control rules

## Step 1

Lets create the rule to define the **Blacklisting**,  this rule will prevent the _preference_ service inaccessible to _customer_ service 

```sh
istioctl create -f src/istiofiles/acl-blacklist.yml -n istio-lab
```
## Step 2

Lets test the **Blacklist** rules:

```sh
curl customer-istio-lab.$(minishift ip).nip.io
```

When we tried to access the customer service, it will return `HTTP 403` forbidden error as the customer service cant access the preference service.   

The output will look something like:

```sh 
customer => 403 PERMISSION_DENIED:denycustomerhandler.denier.istio-lab:Not allowed
```

## Step 3

Let's rollback the **Blacklist** rules:

```sh
istioctl delete -f src/istiofiles/acl-blacklist.yml -n istio-lab
``` 

# Congratulations

Congratulations you have successfully learnt how to define Access Control via **Blacklisting** inside a Istio service mesh.

# References

* [Red Hat OpenShift](https://openshift.com)
* [Learn Istio on OpenShift](https://learn.openshift.com/servicemesh)
* [Istio Homepage](https://istio.io)

