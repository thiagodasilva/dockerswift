#!/bin/sh

cd /etc/swift

python build_rings.py -f /etc/swift_config/cluster_topology.json

swift-ring-master-wsgi-server start -f --pid=/var/run/ring-master/srm.pid

exit 0
