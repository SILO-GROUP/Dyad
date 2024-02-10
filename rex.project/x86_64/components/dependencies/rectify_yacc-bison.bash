#!/bin/bash
set -u

export LC_ALL=C

app="yacc"
symlink_target="bison"


dialog \
	--title "Symlink '${app}' to '${symlink_target}'?" \
	--backtitle "Requirements Remediations" \
	--yesno "Do you want to Symlink ${app} to ${symlink_target}?" 7 60

response=$?

# this is distro-specific and distro-specific function routing should
# account for things like this

function symlink() {
	ln -vs "$(which $2)" "$(dirname $(which $2))/$1"
	return $?
}

install_result=0
case $response in
	0) symlink "$app" "$symlink_target"; install_result=$?;;
	1) echo "Canceled.  You need $app pointing to $symlink_target to run this.";;
	255) echo "Canceled.  You need $app pointing to $symlink_target to run this.";;
esac



exit $install_result
