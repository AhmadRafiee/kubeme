# Kubernetes Update

## On Master Node:
```bash
kubectl drain controlplane --ignore-daemonsets
apt-get install kubeadm=1.19.0-00
kubeadm  upgrade plan
kubeadm  upgrade apply v1.19.0
apt-get install kubelet=1.19.0-00
systemctl daemon-reload
systemctl restart kubelet
kubectl uncordon controlplane
kubectl drain node01 --ignore-daemonsets
```

## On Worker Node:
```bash 
apt-get install kubeadm=1.19.0-00
kubeadm upgrade node --kubelet-version=v1.19.0
apt-get install kubelet=1.19.0-00
systemctl daemon-reload
systemctl restart kubelet     
```

## Back on Master Node:
```bash
kubectl uncordon node01
kubectl get pods -o wide | grep gold # (make sure this is scheduled on master node)
```