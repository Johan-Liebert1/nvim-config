#!/bin/bash

# Doing this here because lua is a shit language

set -e

git -C ~/.config/nvim fetch > /dev/null

count=$(git -C ~/.config/nvim rev-list HEAD..@{u} --count)

if [[ $count == 0 ]]; then 
    # Nothing to fetch
    exit 0
else
    exit 60
fi
