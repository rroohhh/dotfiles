#!/bin/bash

for i in `seq 0 9`; do
	i3-msg "workspace "$i"; append_layout ~/.data/workspace"$i".json" > /dev/null
	for i in `cat .data/workspace$i.json | grep class | sed 's|"class": "^||g' | sed 's|$",||g' | awk '{$1=tolower($1)};1'`; do
		echo $i
		exec nohup $i & /dev/null
	done
done

i3-msg "workspace 1" > /dev/null
