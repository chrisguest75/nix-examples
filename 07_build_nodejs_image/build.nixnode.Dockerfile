FROM nixos/nix
#FROM ubuntu:20.04

WORKDIR /build
COPY build-image.sh /usr/bin/build-image.sh
CMD ["/usr/bin/build-image.sh"]

