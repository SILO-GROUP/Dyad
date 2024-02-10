#!/bin/bash
set -u

export LC_ALL=C

app="awk"
expected_target="gawk"

sym_check $app $expected_target

exit $?
