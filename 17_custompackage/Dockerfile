# syntax=docker/dockerfile:1.4
FROM nixos/nix:latest
#FROM ubuntu:20.04

RUN bash <<EOF 
#!/usr/bin/env bash
cat <<- HEREDOC > /etc/nix/nix.conf
experimental-features = nix-command flakes
HEREDOC
EOF

WORKDIR /build

