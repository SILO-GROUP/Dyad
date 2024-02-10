#!/bin/bash
source ./project_config.sh

TERM=xterm-256color
COLORTERM=truecolor
LC_ALL=C
PATH=${CROSSTOOLS_DIR}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin


function echofail() {
	echo
	echo "FAILED: $1"
	echo
	exit 1
}

ver_check()
{
	if ! type -p $2 &>/dev/null; then 
		echo "ERROR: Cannot find $2 ($1)" 
		return 1
	fi

	v=$($2 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+[a-z]*' | head -n1)

	if printf '%s\n' $3 $v | sort --version-sort --check &>/dev/null; then
		printf "OK:    %-9s %-6s >= $3\n" "$1" "$v"
		return 0
	else
		printf "ERROR: %-9s is TOO OLD ($3 or later required)\n" "$1"
		return 1
	fi
}

ver_kernel()
{
	kver=$(uname -r | grep -E -o '^[0-9\.]+')
	if printf '%s\n' $1 $kver | sort --version-sort --check &>/dev/null; then
		printf "OK:    Linux Kernel $kver >= $1\n"; 
		return 0;
	else
		printf "ERROR: Linux Kernel ($kver) is TOO OLD ($1 or later required)\n" "$kver";
		return 1;
	fi
}

sym_check() {
	# the name of the binary/symlink we're checking as it appears in PATH
	app="$1"

	# the name of the binary we expect it to point to
	expected_target="$2"
	
	# the basename of the target of the symlink (if it is one)
	target="$(basename $(readlink -f $(which $app)))"
	if [[ "$target" == "$expected_target" ]]; then
		printf "OK:\t$app -> $expected_target\n";
		return 0;
	else
		if [[ "$target" == '' ]]; then
			printf "ERROR: '$app' is not present on this system.\n";
			return 1;
		else
			printf "ERROR: '$app' points to '$target' instead of '$expected_target'.\n"
			return 1;
		fi
	fi
}

alias_check() {
	if $1 --version 2>&1 | grep -qi $2; then
		printf "OK:    %-4s is $2\n" "$1";
		return 0;
	else
		printf "ERROR: %-4s is NOT $2\n" "$1"; 
		return 1;
	fi
}
