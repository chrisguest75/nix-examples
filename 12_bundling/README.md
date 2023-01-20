# FLAKES

Demonstrate how to use `nix bundles`.  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-bundle .
# debugging and host repo in build folder
docker run -v $(pwd):/work -it --entrypoint /root/.nix-profile/bin/bash nix-bundle
```

```bash
nix-build multitool.nix

nix bundle --help

# it packages but requires hexdump to run
nix bundle nixpkgs#hello
nix bundle nixpkgs#sox

```

## Resources

https://github.com/NixOS/bundlers
https://github.com/NixOS/bundlers/blob/master/flake.nix

