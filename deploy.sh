#!/usr/bin/env bash

mkdir staging
cd staging
git clone git@github.com:nmelnick/whatbot.git
cd whatbot
for module_name in whatbot whatbot-*/ Task-whatbot ; do
	module_name=${module_name%/}
	MOD=`grep all_from $module_name/Makefile.PL | sed 's/all_from .\(.*pm\)../\1/'`
	VER=`grep 'VERSION =' $module_name/$MOD | sed 's/^.*VERSION = .\([0-9]\+.[0-9]\+\).*/\1/'`
	PACK="$module_name-$VER.tar.gz"
	echo $PACK
	tar cvf - $module_name | gzip > ../$PACK
done
