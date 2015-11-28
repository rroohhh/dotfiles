#!/bin/bash

for i in `seq 0 9`; do
	i3-save-tree --workspace=$i | sed 's|// "cla|"cla|g' | sed 's|// "tran|"tran|g' | sed 's|// "wind|"wind|g' > $HOME/.data/workspace$i.json
done
