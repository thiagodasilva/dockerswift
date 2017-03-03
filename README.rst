dockerswift
===========

Simple PoC to run a small swift cluster in Kubernetes.
Usage
-----
Install and start minikube to run Kubernetes locally inside a VM:

    Follow directions here: https://kubernetes.io/docs/getting-started-guides/minikube/

Build the image:

    docker build -t swift-storage:v1 -f ./Dockerfile.storage .
    docker build -t swift-proxy:v1 -f ./Dockerfile.proxy .

Build the rings:

    cd config/swift/rings && ./make_rings.sh && cd ../../..

Run cluster:

    kubectl create -f swift_pod.yaml
    kubectl create -f swift_service.yaml
    kubectl get services
    minikube service swiftservice --url
    curl -i http://192.168.99.100:32499/info
    echo "hello world" > hw
    swift -A http://192.168.99.100:32499/auth/v1.0 -U admin:admin -K admin upload c1 hw
