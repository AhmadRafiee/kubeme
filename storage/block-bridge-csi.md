# Installation blockbridge storage
## [Installation doc](https://www.blockbridge.com/container/) 

```bash
curl -sSL https://get.blockbridge.com/container | sh
```
### Output sample
```bash
=================================================================================
Blockbridge Storage Container 4.3.0-5544.1 (2dd7e0e7-58ea-4ba0-b2e3-7dce825395c4)
Mode: converged

Generated Credentials (may not reflect current system state)

System admin API token:  1/l80dMWIzFS3HBEX2NfyP8t0j9R5r7gs06uLgFQBCjviHzR0xYjMUbA
System admin username:   system
System admin password:   ae1e4fac18e8d90f8f506971dbd77e68
Default user username:   default
Default user password:   0ce4bb39c8fc8b62ea59410add93fc6e
Volume plugin API token: 1/ZTflCxlKcKEMM4WbixkcVin9FmQLFvn9ou16Waqk1WBFN+ULGUpx4A
=================================================================================
```

# Kubernetes CSI Storage Gide  

### Blockbridge provides a Container Storage Interface (CSI) driver to deliver persistent, secure, multi-tenant, cluster-accessible storage for Kubernetes. This [Link](https://kb.blockbridge.com/guide/kubernetes/) describes how to deploy Blockbridge as the storage backend for Kubernetes containers.

### If you’ve configured other Kubernetes storage drivers before, you may want to start with the Quickstart section. The rest of the guide has detailed information about features, driver configuration options and troubleshooting.

### Sample configuration
```bash
export BLOCKBRIDGE_API_HOST=172.60.70.1
docker run --rm -it -e BLOCKBRIDGE_API_HOST docker.io/blockbridge/cli:latest-alpine bb --no-ssl-verify-peer account create --name kubernetes
export BLOCKBRIDGE_API_SU=kubernetes
docker run --rm -it -e BLOCKBRIDGE_API_HOST -e BLOCKBRIDGE_API_SU docker.io/blockbridge/cli:latest-alpine bb --no-ssl-verify-peer authorization create --notes 'csi-blockbridge driver access'
export BLOCKBRIDGE_API_KEY="1/euGTmJ66eMFLA9ILv/mVlKOjYV727pzYFndv6TZ7obs64ZOYnrp5gA"

cat > secret.yml <<- EOF
apiVersion: v1
kind: Secret
metadata:
  name: blockbridge
  namespace: kube-system
stringData:
  api-url: "https://${BLOCKBRIDGE_API_HOST}/api"
  access-token: "$BLOCKBRIDGE_API_KEY"
  ssl-verify-peer: "false"
EOF
kubectl create -f ./secret.yml
kubectl -n kube-system get secrets blockbridge

kubectl apply -f https://get.blockbridge.com/kubernetes/5.1/csi/csi-blockbridge-v2.0.0.yaml
kubectl -n kube-system get pods -l role=csi-blockbridge

```

### Sample create PVC manifest

```bash
# sample PVC
kubectl apply -f https://get.blockbridge.com/kubernetes/5.1/examples/csi-pvc.yaml
kubectl get pvc csi-pvc-blockbridge

# Sample pod with pvc
kubectl apply -f https://get.blockbridge.com/kubernetes/5.1/examples/csi-app.yaml
kubectl get pod blockbridge-demo

# Sample manifest
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: web-pvc-test-1
  namespace: default
spec:
  accessModes: [ "ReadWriteOnce" ]
  storageClassName: "blockbridge-gp"
  resources:
   requests:
     storage: 1Gi
```

