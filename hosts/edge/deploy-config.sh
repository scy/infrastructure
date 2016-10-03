#!/bin/sh

me='deploy-config.sh'
backupdir="$(pwd)/etc~"

msg() {
	printf '%s\n' "$*"
}

if [ ! -x "$me" ]; then
	msg "please cd to the directory $me is in first" >&2
	exit 1
fi

msg 'generating DHCP and DNS config'
awk -F , '{ sub(/ *#.*$/, "") } /./ { print $1 "," $2 }' hosts.txt > etc/dnsmasq.staticdhcp
awk -F , '{ sub(/ *#.*$/, "") } /./ { print $2 " " $3 ".b17.scy.name" }' hosts.txt > etc/dnsmasq.hosts

msg 'rsyncing config into place'
sudo rsync -rtlib --backup-dir="$backupdir" etc /

msg 'restarting dnsmasq'
sudo service dnsmasq restart
