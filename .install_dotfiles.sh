#!/bin/bash
git ls-files -z | rsync --files-from=- -abv0  . ~
git submodule status |
column -t |
tr -s ' ' |
cut -d ' ' -f 2 |
while read dir
    do rsync -av --delete "${dir}/" "${HOME}/${dir}"
done
