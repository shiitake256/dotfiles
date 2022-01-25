#!/bin/bash
git ls-files | while read; do
    ln -sfv $(readlink -f "$REPLY") ~/
done
