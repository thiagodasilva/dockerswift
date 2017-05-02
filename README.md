kubernetes-swift
===========

Simple PoC to run a small swift cluster in Kubernetes.

Usage
-----

### Start the kubernetes cluster using the Vagrantfile

  * `./up.sh`

  This will start 4 VMs and configure kubernetes with 1 master and 3 worker
  nodes. Once provisioning is complete, the admin.conf file will be copied to
  /vagrant in the master node, which will allow for accessing the kubernetes
  cluster from the host machine.

  To access the kubernetes cluster, install kubectl and set the enviroment
  variable like:

  * `export KUBECONFIG=/home/thiago/Projects/kubernetes-swift/admin.conf`
  * `kubectl get nodes`

### Create Swift cluster with Quartermaster

After provisioning the kubernetes cluster and configuring kubectl, run
quartermaster and deploy the swift cluster:

  1. `kubectl run -n kube-system kube-qm --image=thiagodasilva/qm`
  1. `kubectl create -f swift-cluster.yaml`
  1. `kubectl get all`

Now test the Swift cluster:

  1. `kubectl get svc`
  1. `curl -i http://192.168.10.90:32499/info`  <---- update port
  1. `echo "hello world" > hw`
  1. `swift -A http://192.168.10.90:32499/auth/v1.0 -U admin:admin -K admin upload c1 hw`

Checkout this asciicast for a demo of deploying quartermaster and swift cluster:

[![asciicast](https://asciinema.org/a/118177.png)](https://asciinema.org/a/118177?speed=2&autoplay=1)