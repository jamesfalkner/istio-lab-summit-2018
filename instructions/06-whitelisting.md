# Access Control - Whitelisting

In this lab we will learn how to **Whitelist** i.e. to control the service to service access within the service mesh.

## What you will learn

* Define **Whitelist** access control rules

## Step 1

Create the **Whitelist** rules, this rule makes the _preferences_ services accessible only from the _recommendation_ service

```sh
istioctl create -f src/istiofiles/acl-whitelist.yml -n tutorial
```

## Step 2

Lets now test the **Whitelisting** by calling the service directly:

```sh
curl customer-tutorial.$(minishift ip).nip.io 
```

Invoking the above curl command should result in:

```sh
customer => 404 NOT_FOUND:preferencewhitelist.listchecker.tutorial:customer is not whitelisted
```

Trying to access the customer service returns `HTTP 404`, as preference service is accessible only from the recommendation service.

## Step 3

Lets rollback the changes that were done for this **Whitelisting** lab:

```sh
istioctl delete -f src/istiofiles/acl-whitelist.yml -n tutorial
```

# Congratulations

Congratulations you have successfully learnt how to define Access Control via **Whitelisting** inside a Istio service mesh

# References

* [Red Hat OpenShift](https://openshift.com)
* [Learn Istio on OpenShift](https://learn.openshift.com/servicemesh)
* [Istio Homepage](https://istio.io)
