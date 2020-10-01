#!/bin/bash

FGLVER=$(fglrun -V | head -1 | awk '{FS=" ";}{print $2}')
GRETEST=~/all/my_github/gre_test4rp/bin-$FGLVER
export FGLLDPATH=$GRETEST:$GREDIR/lib
export FGLRESOURCEPATH=$GRETEST
export GREFILEPATH=${GREFILEPATH:-$(pwd)}
export FONTDIR=~/.fonts
export GRESERVER=${GRESERVER:-localhost}
export GRESRVPORT=${GRESRVPORT:-6490}

l_inFile=$1
l_4rp=$2
l_device=$3
l_targetName=$4

if [ -z "$l_inFile" ]; then
	echo "No xml passed"
	echo "USAGE: inFile 4rp device targetName"
	exit 1
fi

if [ ! -z $l_targetName ]; then
	unset FGLSERVER
fi

echo XML=$l_inFile
echo 4RP=$l_4rp
echo Dev=$l_device
echo Out=$l_targetName

fglrun $GRETEST/gre_test4rp.42r $l_inFile $l_4rp $l_device $l_targetName

if [ $? -eq 0 ]; then
	if [ "$l_device" = "PDF" ]; then
		xdg-open $l_targetName
	fi
fi
