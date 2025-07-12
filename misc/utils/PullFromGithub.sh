#!/bin/bash
#pull changes from powersynth github (pull origin)
#or use it with custom commands like (reset --hard origin/dev)

ThisDir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

PSRoot=`realpath $ThisDir/../../..`

: "${PREFIX:=$PSRoot}"

if [ $# -eq 0 ]; then
	args=("pull" "origin")
else
	args=("$@") 
fi

test -d "$PREFIX/lib/site-packages" && LibDir="$PREFIX/lib/site-packages" || LibDir=`cd "$PREFIX/lib/python3."?? && pwd`/site-packages

echo "INFO: Updating PSRoot at $PSRoot with source code at $LibDir."
for repo in "$PREFIX/pkg" "$LibDir/core" "$LibDir/gui"
do
	echo "INFO: git ${args[@]} $repo"
	git -C "$repo" fetch --all
	git -C "$repo" "${args[@]}"
done