#!/bin/bash
git ls-files -z | rsync --files-from=- -abv0  . ~
