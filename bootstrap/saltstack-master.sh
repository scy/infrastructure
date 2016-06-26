#!/bin/sh
set -e

myname='bootstrap saltstack master'
. ./common-code.sh

gpgkey='../keys/public/saltstack.asc'

[ -r "$gpgkey" ] || die "cannot find or read OpenPGP key: $gpgkey"

host="$1"
[ -n "$host" ] || die 'please supply the host name to bootstrap as a parameter'

run() {
	ssh -o VisualHostKey=no "$host" "$@"
}

msg 'checking connection…'
run true || die "SSH connection to $host did not work"

msg 'installing salt…'
run 'echo "Apt::Install-Suggests \"0\";" > /etc/apt/apt.conf.d/50-no-suggests && apt-key add - && echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" > /etc/apt/sources.list.d/saltstack.list && apt-get update && apt-get -y install salt-master salt-minion' < "$gpgkey"
