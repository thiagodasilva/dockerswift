# proxy1
kubectl cp object.ring.gz swift-proxy-deployment-1391250756-90qwp:/etc/swift/object.ring.gz
kubectl cp account.ring.gz swift-proxy-deployment-1391250756-90qwp:/etc/swift/account.ring.gzj
kubectl cp container.ring.gz swift-proxy-deployment-1391250756-90qwp:/etc/swift/container.ring.gz

# storage node 0
kubectl cp object.ring.gz swift-storage-09klf:/etc/swift/object.ring.gz
kubectl cp account.ring.gz swift-storage-09klf:/etc/swift/account.ring.gzj
kubectl cp container.ring.gz swift-storage-09klf:/etc/swift/container.ring.gz

# storage node 1
kubectl cp object.ring.gz swift-storage-w6518:/etc/swift/object.ring.gz
kubectl cp account.ring.gz swift-storage-w6518:/etc/swift/account.ring.gzj
kubectl cp container.ring.gz swift-storage-w6518:/etc/swift/container.ring.gz
