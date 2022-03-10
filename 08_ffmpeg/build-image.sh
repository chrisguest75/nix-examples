#!/usr/bin/env sh
#nix-build ./ffmpeg-full.nix 
nix-build ./ffmpeg-light.nix 
if [[ $? -eq 0 ]]; then
    if [[ -f $(readlink ./result) ]]; then
        mv $(readlink ./result) ./ffmpeg-image
    else
        echo "BUILD FAILED - FILE NOT FOUND"
    fi
else
    echo "BUILD FAILED"
fi
