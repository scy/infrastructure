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

msg 'rsyncing config into place'
sudo rsync -rtlib --backup-dir="$backupdir" etc /
