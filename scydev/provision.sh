#!/bin/sh
set -e

# Don't use the default Vagrant box hostname.
hostnamectl set-hostname scydev
sed -i -e 's/contrib-jessie/scydev/g' /etc/hosts

# The following commands are basically what bootstrap/saltstack-local.jessie64.sh suggests.

apt install -y curl sudo

curl -L https://github.com/scy/infrastructure/archive/master.tar.gz | tar zxv
cd infrastructure-master/bootstrap
./saltstack-local.jessie64.sh
cd ../..
rm -r infrastructure-master
