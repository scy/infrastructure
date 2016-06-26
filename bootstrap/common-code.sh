#!/bin/sh
set -e

msg() {
	prefix=''
	[ -n "$myname" ] && prefix="$myname: "
	printf '%s%s\n' "$prefix" "$*"
}

die() {
	msg "$*" >&2
	exit 1
}
