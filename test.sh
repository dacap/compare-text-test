#! /bin/sh

function expect() {
    if [[ $1 != "$($2 | tr -d "\r")" ]] ; then
	echo "FAILED: $2"
	echo "EXPECTED: $1"
	echo "RESULT: $($2)"
	return 1
    else
	return 0
    fi
}

# abc == abc
if expect "a
b
c" ./abc ; then
    echo OK
else
    exit 1
fi

# abb != abc
if ! expect "a
b
b" ./abc ; then
    echo OK
else
    exit 1
fi
