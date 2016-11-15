#!/bin/bash

sudo useradd -s '/bin/bash' -m -p '$1$xyz$OqdKgFcvYXz.U2jb8YH/S.' user
sudo sh -c 'echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user'
sudo sh -c 'echo "nameserver 10.100.1.5" > /etc/resolvconf/resolv.conf.d/base'
sudo sh -c 'echo "nameserver 10.100.1.5" > /etc/resolvconf/resolv.conf.d/head'
sudo resolvconf -u
sudo sh -c 'echo "LC_ALL=\"en_US.UTF-8\""  >  /etc/default/locale'
