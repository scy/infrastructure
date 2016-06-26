#!/bin/sh
set -e

aptkey_salt='../keys/public/apt.saltstack.asc'

msg() {
	prefix=''
	[ -n "$myname" ] && prefix="$myname: "
	printf '%s%s\n' "$prefix" "$*"
}

die() {
	msg "$*" >&2
	exit 1
}
