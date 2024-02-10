#!/bin/bash
set -u

export LC_ALL=C

app="sh"
expected_target="bash"

sym_check $app $expected_target

exit $?
