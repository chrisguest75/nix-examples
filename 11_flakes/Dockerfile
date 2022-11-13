# syntax=docker/dockerfile:1.4
FROM nixos/nix:latest
#FROM ubuntu:20.04

WORKDIR /work

COPY --chmod=755 <<EOF /work/enable-flakes.sh
#!/usr/bin/env bash
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
EOF
RUN "/work/enable-flakes.sh"

ENTRYPOINT [ "/bin/bash" ]

