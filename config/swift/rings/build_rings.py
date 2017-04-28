#!/usr/bin/env python
from __future__ import print_function
from optparse import OptionParser
from os.path import exists
from swift.cli.ringbuilder import main as rb_main

import json
import sys
import threading

USAGE = "usage: %prog -f <swift_cluster_json>"


def run_and_wait(func, *args):
    t = threading.Thread(target=func, args=args)
    t.start()
    return t.join()


def create_builder_file(builder_file, part_power, repl, min_part_hours):
    run_and_wait(rb_main, ['swift-ring-builder', builder_file, 'create',
                 part_power, repl, min_part_hours])


def add_node_to_ring(builder_file, node, port):
    # swift-ring-builder account.builder add r1z1-10.44.0.2:6202/sdb1_ 1
    network = node['storageNetwork']
    ip = network['ips'][0]
    # repl_ip = network['ips'][0]
    for dev in node['devices']:
        host_str = 'r1z1-%s:%s/%s' % (ip, port, dev)
        print(host_str)
        run_and_wait(rb_main, ["swift-ring-builder", builder_file, 'add',
                     host_str, '1'])


def create_ring(cluster_spec, builder_file, port):
    create_builder_file(builder_file, 8, 1, 1)
    for node in cluster_spec['storageNodes']:
        add_node_to_ring(builder_file, node, port)

    # Rebalance ring
    run_and_wait(rb_main, ['swift-ring-builder', builder_file, 'rebalance'])


def main(cluster_file):
    try:
        with open(cluster_file) as cluster_json:
            cluster = json.load(cluster_json)
    except Exception as e:
        print("Failed to load json file: %s" % e)
        return 1

    spec = cluster['spec']

    create_ring(spec, 'account.builder', '6202')
    create_ring(spec, 'container.builder', '6201')
    create_ring(spec, 'object.builder', '6200')

if __name__ == "__main__":
    parser = OptionParser(USAGE)
    parser.add_option("-f", "--file", dest="cluster",
                      help="Specify the swift cluster topology file.",
                      metavar="FILE",
                      default="/etc/swift/swift_cluster.json")

    options, args = parser.parse_args(sys.argv[1:])
    if options.cluster and not exists(options.cluster):
        print("Swift cluster topology file not found or doesn't exist")
        parser.print_help()
        sys.exit(1)

    sys.exit(main(options.cluster))
