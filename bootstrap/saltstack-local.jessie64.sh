#!/bin/sh
set -e

# Install curl and sudo first, then, as root or normal user:
# curl -L https://github.com/scy/infrastructure/archive/master.tar.gz | tar zxv && cd infrastructure-master/bootstrap && ./saltstack-local.jessie64.sh && cd ../.. && rm -r infrastructure-master

myname='saltstack-local.jessie64'
. ./common-code.sh

alias salt-local='sudo salt-call --local --retcode-passthrough'

msg 'copying SaltStack sources.list'
sudo cp ../config/debian/etc/apt/sources.list.d/saltstack.jessie64.list /etc/apt/sources.list.d
msg 'copying no-suggests apt config'
sudo cp ../config/debian/etc/apt/apt.conf.d/70-no-suggests /etc/apt/apt.conf.d
msg 'adding SaltStack apt key'
sudo apt-key add "$aptkey_salt"
msg 'apt-get update'
sudo apt-get update

msg 'installing git and salt-common'
sudo apt-get install -y git salt-common

msg 'initializing essential configuration'
salt-local --file-root=../salt state.apply salt.sha512
salt-local --file-root=../salt state.apply salt.local-only

msg 'cloning the infrastructure repository'
salt-local --file-root=../salt state.apply infra-repo

msg 'calling state.apply'
salt-local state.apply
