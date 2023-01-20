# syntax=docker/dockerfile:1.4
FROM nixos/nix:latest
#FROM ubuntu:20.04

WORKDIR /work

COPY multitool.nix /work/multitool.nix

COPY --chmod=755 <<EOF /work/enable-bundle.sh
#!/usr/bin/env bash
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
EOF
RUN "/work/enable-bundle.sh"

ENTRYPOINT [ "/bin/bash" ]

