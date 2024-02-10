#!/bin/bash
set -u

export LC_ALL=C

app="yacc"
expected_target="bison"

sym_check $app $expected_target

exit $?
