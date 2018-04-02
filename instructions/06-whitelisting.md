# Access Control - Whitelisting

In this lab we will learn how to **whitelist** i.e. to control the service to service access within the service mesh.

## What you will learn

* Define Service Whitelist rules
  The Whitelist rule makes the preferences services accessible only from the recommendation service

## Step 1

Create the whitelist rules:

```sh
istioctl create -f src/istiofiles/acl-whitelist.yml -n <project name>
```

## Step 2

Lets now test the whitelisting by calling the service directly:

```sh
curl customer-tutorial.$(minishift ip).nip.io 
```

Invoking the above curl command should result in:

```sh
customer => 404 NOT_FOUND:preferencewhitelist.listchecker.tutorial:customer is not whitelisted
```

The access returns `HTTP 404`, as preference service is accessible only from the recommendation service.

## Step 3

Lets rollback the changes that were done for this whitelisting lab:

```sh
istioctl delete -f src/istiofiles/acl-whitelist.yml -n <project-name>
```

# References

* [Istio Homepage](https://istio.io)
* [Red Hat OpenShift](https://openshift.com)
* Others...
