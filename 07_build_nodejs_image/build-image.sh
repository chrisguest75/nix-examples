#!/usr/bin/env sh
nix-build
if [[ $? -eq 0 ]]; then
    if [[ -f $(readlink ./result) ]]; then
        mv $(readlink ./result) ./docker-image
    else
        echo "BUILD FAILED - FILE NOT FOUND"
    fi
else
    echo "BUILD FAILED"
fi
