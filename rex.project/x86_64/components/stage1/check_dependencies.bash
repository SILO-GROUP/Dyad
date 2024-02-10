#!/bin/bash
# Simple script to list version numbers of critical development tools
set -u

export LC_ALL=C

pushd /tmp
rm -fv dummy*
echo
echo "Testing compiler..."
echo 'int main(){}' > dummy.c || echofail "failed to generate /tmp/dummy.c"
g++ -o dummy dummy.c || echofail "failed to compile /tmp/dummy.c"
./dummy || echofail "could not execute test program"

if [ -x dummy ];  then 
	rm -fv dummy*
	echo "g++ compilation OK"
else
	rm -fv dummy*
	echofail "g++ compilation failed"
fi


echo

