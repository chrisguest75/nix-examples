#!/usr/bin/env sh
nix-build
mv $(readlink ./result) ./docker-image