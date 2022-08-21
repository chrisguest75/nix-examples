#| Developer Documentation:
#| https://github.com/bitnami/minideb
#| https://http://nixos.org/nix/

# STAGE 1. Assembly Packages
FROM bitnami/minideb:stretch as BUILDER

# Obtaining Dependencies
RUN install_packages ca-certificates curl bzip2

# NIX Configuration
ARG NIX_USER=nixon
ARG NIX_RELEASE=1.11.15
ARG NIX_DOWNLOAD_URL=https://nixos.org/releases/nix/nix-$NIX_RELEASE/nix-$NIX_RELEASE-x86_64-linux.tar.bz2
ARG NIX_PATH=/nix
ARG NIX_STARTUP=.nix-profile/etc/profile.d/nix.sh
ARG HOME=/home/$NIX_USER

ENV USER=$NIX_USER

# Install NIX
RUN mkdir -p $NIX_PATH && curl -SL $NIX_DOWNLOAD_URL | tar -xj -C $NIX_PATH --strip-components=1

RUN adduser --disabled-password --gecos "" ${NIX_USER} && chown $NIX_USER:$NIX_USER $NIX_PATH -R
USER $NIX_USER
WORKDIR $HOME

RUN $NIX_PATH/install
COPY System.nix $HOME/System.nix

# Build system bundle
RUN chmod +x $NIX_STARTUP && . $NIX_STARTUP && nix-build System.nix

# STAGE 2. Configure Userland
FROM gcr.io/distroless/base

COPY --from=BUILDER /home/nixon/result/bin/ /bin/
COPY --from=BUILDER /nix /nix

ENTRYPOINT ["/bin/fish"]