#!/bin/sh

cp /etc/swift_config/*.conf /etc/swift/

swift-ring-minion-server start -f

exit 0
