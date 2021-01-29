FROM nixos/nix
#FROM ubuntu:20.04

WORKDIR /workbench
COPY default.nix default.nix
RUN nix-build
