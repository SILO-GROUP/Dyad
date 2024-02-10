#!/bin/bash
set -u

export LC_ALL=C

real_name="bison"
app="bison"

dialog \
	--title "Install ${real_name}?" \
	--backtitle "Requirements Remediations" \
	--yesno "Do you want to install ${real_name} on the build host?" 7 60

response=$?

# this is distro-specific and distro-specific function routing should
# account for things like this

case $response in
	0) dnf -y install $app; install_result=$?;;
	1) echo "Canceled.  You need $real_name to run this.";;
	255) echo "Canceled.  You need $real_name to run this.";;
esac



exit $install_result
