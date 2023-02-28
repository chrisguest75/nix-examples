# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

RUN apt-get update \
        && apt-get --no-install-recommends install bash curl ca-certificates -y \ 
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY ./multitool /work/multitool
COPY ./jq.nix /work/jq.nix

COPY --chmod=755 <<EOF /work/install-nix.sh
#!/usr/bin/env bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
EOF
RUN "/work/install-nix.sh"


ENTRYPOINT [ "/bin/bash" ]
