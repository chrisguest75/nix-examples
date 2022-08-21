FROM nixos/nix:latest

WORKDIR /scratch
COPY jq.nix jq.nix
RUN nix-build ./jq.nix

