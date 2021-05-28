# Installation blockbridge storage
## [Installation doc](https://www.blockbridge.com/container/) 

```bash
curl -sSL https://get.blockbridge.com/container | sh
```

# Kubernetes CSI Storage Gide  

### Blockbridge provides a Container Storage Interface (CSI) driver to deliver persistent, secure, multi-tenant, cluster-accessible storage for Kubernetes. This [Link](https://kb.blockbridge.com/guide/kubernetes/) describes how to deploy Blockbridge as the storage backend for Kubernetes containers.

### If you’ve configured other Kubernetes storage drivers before, you may want to start with the Quickstart section. The rest of the guide has detailed information about features, driver configuration options and troubleshooting.




# Sample create PVC manifest

```bash
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