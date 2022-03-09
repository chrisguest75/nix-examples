FROM nixos/nix

WORKDIR /output

RUN nix-env -iA nixpkgs.ffmpeg-full

CMD ["/root/.nix-profile/bin/ffmpeg"]