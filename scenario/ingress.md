# How to install and use kubernetes ingress

# Ingress-nginx
## [Deploy ingress-nginx with helm](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/)

## Getting the Chart Sources
### Clone the Ingress controller repo:
```bash
git clone https://github.com/nginxinc/kubernetes-ingress/
```
### Change your working directory to /deployments/helm-chart:
```bash
cd kubernetes-ingress/deployments/helm-chart
git checkout v1.11.3
```
## Adding the Helm Repository
### This step is required if you’re installing the chart via the helm repository.
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm pull ingress-nginx/ingress-nginx
```
## Installing via Helm Repository
```bash 
tar -xzvf ingress-nginx-3.33.0.tgz
helm install ingress-nginx ./ingress-nginx
```