swift-ring-builder account.builder create 8 1 0
swift-ring-builder container.builder create 8 1 0
swift-ring-builder object.builder create 8 1 0

swift-ring-builder account.builder add r1z1-127.0.0.1:6202/sda_ 1
swift-ring-builder container.builder add r1z1-127.0.0.1:6201/sda_ 1
swift-ring-builder object.builder add r1z1-127.0.0.1:6200/sda_ 1

swift-ring-builder account.builder rebalance
swift-ring-builder container.builder rebalance
swift-ring-builder object.builder rebalance

