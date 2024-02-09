#!/bin/bash
set -u

export LC_ALL=C

expected_version="$1"
app="bash"

ver_check $app $expected_version || echofail "$app $expected_version check failed."
exit $?
