swift-ring-builder account.builder create 8 3 0
swift-ring-builder account.builder add r1z1-10.44.0.2:6202/sdb1_ 1
swift-ring-builder account.builder add r1z1-10.44.0.2:6202/sdc1_ 1
swift-ring-builder account.builder add r1z1-10.44.0.2:6202/sdd1_ 1
swift-ring-builder account.builder add r1z1-10.47.0.1:6202/sdb1_ 1
swift-ring-builder account.builder add r1z1-10.47.0.1:6202/sdc1_ 1
swift-ring-builder account.builder add r1z1-10.47.0.1:6202/sdd1_ 1
swift-ring-builder account.builder rebalance

swift-ring-builder container.builder create 8 2 0
swift-ring-builder container.builder add r1z1-10.47.0.1:6201/sdb1_ 1
swift-ring-builder container.builder add r1z1-10.47.0.1:6201/sdc1_ 1
swift-ring-builder container.builder add r1z1-10.47.0.1:6201/sdd1_ 1
swift-ring-builder container.builder add r1z1-10.44.0.2:6201/sdb1_ 1
swift-ring-builder container.builder add r1z1-10.44.0.2:6201/sdc1_ 1
swift-ring-builder container.builder add r1z1-10.44.0.2:6201/sdd1_ 1
swift-ring-builder container.builder rebalance

swift-ring-builder object.builder create 8 2 0
swift-ring-builder object.builder add r1z1-10.47.0.1:6200/sdb1_ 1
swift-ring-builder object.builder add r1z1-10.47.0.1:6200/sdc1_ 1
swift-ring-builder object.builder add r1z1-10.47.0.1:6200/sdd1_ 1
swift-ring-builder object.builder add r1z1-10.44.0.2:6200/sdb1_ 1
swift-ring-builder object.builder add r1z1-10.44.0.2:6200/sdc1_ 1
swift-ring-builder object.builder add r1z1-10.44.0.2:6200/sdd1_ 1
swift-ring-builder object.builder rebalance
