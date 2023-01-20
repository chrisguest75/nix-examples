# syntax=docker/dockerfile:1.4
FROM nixos/nix:latest
#FROM ubuntu:20.04

WORKDIR /work

COPY multitool.nix /work/multitool.nix

COPY --chmod=755 <<EOF /work/bundle.sh
#!/usr/bin/env bash
EOF

ENTRYPOINT [ "/bin/bash" ]

