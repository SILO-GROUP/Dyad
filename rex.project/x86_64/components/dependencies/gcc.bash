#!/bin/bash
set -u

export LC_ALL=C

expected_version="$1"
real_name="coreutils"
app="sort"

ver_check $real_name $app $expected_version || echofail "$real_name $expected_version check failed."
exit $?
