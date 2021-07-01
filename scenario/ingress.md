# How to install and use kubernetes ingress

# Ingress-nginx
## [Deploy ingress-nginx](https://kubernetes.github.io/ingress-nginx/deploy/)


### Install ingress-nginx with this commands:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/cloud/deploy.yaml
```

## check pod and service 
```bash
kubectl get all -n ingress-nginx
```

## Issue and Fix

### [Issuse1:](https://github.com/kubernetes/ingress-nginx/issues/5583)
```bash 
Post https://ingress-nginx-controller-admission.ingress-nginx.svc:443/extensions/v1beta1/ingresses?timeout=30s: context deadline exceeded
```
### Fix1:
```bash
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
```