dockerswift
===========

Simple PoC to run a small swift cluster in Kubernetes.

Usage
-----

### Install and start minikube to run Kubernetes locally inside a VM:

  * Follow directions here: https://kubernetes.io/docs/getting-started-guides/minikube/

### Build the image:

  1. `docker build -t swift-storage:v1 -f ./Dockerfile.storage .`
  1. `docker build -t swift-proxy:v1 -f ./Dockerfile.proxy .`

### Build the rings:

  1. `cd config/swift/rings && ./make_rings.sh && cd ../../..`

### Run cluster:

  1. `kubectl create -f swift_pod.yaml`
  1. `kubectl create -f swift_service.yaml`
  
### Test cluster:

  1. `kubectl get services`
  1. `minikube service swiftservice --url`
  1. `curl -i http://192.168.99.100:32499/info`  <---- update IP
  1. `echo "hello world" > hw`
  1. `swift -A http://192.168.99.100:32499/auth/v1.0 -U admin:admin -K admin upload c1 hw`
