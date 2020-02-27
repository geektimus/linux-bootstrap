#!/usr/bin/env sh

# GitKraken

gitkraken() {
    if [ "$1" != ""  ]; then
	/opt/gitkraken/gitkraken -p $1 > /dev/null 2>&1 &
    else
	/opt/gitkraken/gitkraken -p . > /dev/null 2>&1 &
    fi
    disown
}

compare-files() {
    if [ "$1" != "" ] && [ "$2" != "" ]; then
	/usr/bin/meld $1 $2 > /dev/null 2>&1 &
	disown
    else
	echo "Error: Both files are required for the comparison to work"
	exit 100
    fi
}
