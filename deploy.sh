#!/usr/bin/env bash

mkdir staging
cd staging
git clone git@github.com:nmelnick/whatbot.git
cd whatbot
for module_name in Whatbot Whatbot-*/ Task-Whatbot ; do
	module_name=${module_name%/}
	MOD=`grep all_from $module_name/Makefile.PL | sed 's/all_from .\(.*pm\)../\1/'`
	VER=`grep 'VERSION =' $module_name/$MOD | sed 's/^.*VERSION = .\([0-9]\+.[0-9]\+\).*/\1/'`
	SUFFIX="$(printf '_%02d' $1)"
	VER=$VER$SUFFIX
	PACK="$module_name-$VER.tar.gz"
	echo $PACK
	tar cf - $module_name | gzip > ../$PACK
done
