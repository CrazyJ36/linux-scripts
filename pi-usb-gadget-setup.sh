#!/bin/bash
ip a add 192.168.7.1/24 dev enp0s29f7u3i1
ip a add 192.168.7.1/24 dev enp0s29f7u3
ip link set enp0s29f7u3i1 up
ip link set enp0s29f7u3 up

ssh -p 1024 pi@192.168.7.2
