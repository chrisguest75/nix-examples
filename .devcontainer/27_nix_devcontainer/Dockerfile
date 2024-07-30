# syntax=docker/dockerfile:1.4
# Check versions here https://github.com/devcontainers/images/tree/main/src/base-ubuntu
FROM mcr.microsoft.com/devcontainers/base:ubuntu20.04  

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends shellcheck bash curl ca-certificates 

WORKDIR /work
COPY --chmod=755 <<EOF /work/install-nix.sh
#!/usr/bin/env bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --init none --no-confirm
EOF
RUN "/work/install-nix.sh"

USER vscode
