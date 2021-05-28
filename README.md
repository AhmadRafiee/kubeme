# kubeme
The tools and sample needed to learn the Kubernetes

# Table and Content
  - [vagrant virtualbox provider](vagrant/vagrant-virtualbox-stage)
  - [kind config files](kind)
  - [kubectl tips](scenario/kubectl-tips.md)
  - [kubectl sample commands](scenario/kubectl-command-sample.md)
  - [kubernetes dns test](scenario/kubernetes-dns-test.md)
  - [kubernetes manifest](manifests/)
  - [kubernetes multi-node installation](multi-node/multi-node-installation.md)
  - [kubernetes multi-node update](multi-node/multi-node-update.md)
  - [kubernetes service account sample](scenario/service-account.md)
  - [kubernetes dns test](scenario/kubernetes-dns-test.md)
  - [kubernetes dashboard installation](scenario/dashboard-installation.md)
  - [kubernetes sample app](scenario/sample-app)
  - [kubernetes sample nginx](scenario/nginx-test)
  - [kubernetes ingress treeafik](scenario/ingress-traefik)
  - [kubernetes and ceph-csi ](storage/ceph-csi.md)
  - [kubernetes and bb-csi](storage/block-bridge-csi.md)
  - [docker elk scenario](scenario/docker/elk-single/)


# in-progress
- Installation
    - vagrant
    - packer
        - build packer image
    - kind

- Deploy: 
    - LB-ingress

- Tests:
    - drian node
    - corden node
    - taint | toleration
    - update 
    - backup | restore
    - rollout
    - blue | green deployment
    - statefulset test 

- Deployment on kube:
    - ceph-csi 
    - bb-csi
    - ingress-nginx
    - ingress-traefik
    - kubernetes-dashboard
    - portainer-dashboard
    - wavescope
    - velero
    - kubernetes-metrics
    - monitoring prometheus
    - logging loki | efk 
    - wordperss
    - private-registry harbor | jfrog