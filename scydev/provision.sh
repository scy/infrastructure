#!/bin/sh
set -e

# Don't use the default Vagrant box hostname.
hostnamectl set-hostname scydev
sed -i -e 's/contrib-jessie/scydev/g' /etc/hosts

# Bootstrap Salt. We can leave out some of the usual steps like fetching the repo.
cd /root/infrastructure/bootstrap
./saltstack-local.jessie64.sh
