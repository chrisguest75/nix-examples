# FLAKES

Demonstrate how to use `nix bundles`.  

## 🏠 Build and Run

```sh
# build nix
docker build --no-cache -t nix-bundle .   
# debugging and host repo in build folder
docker run -v $(pwd):/work -it --entrypoint /root/.nix-profile/bin/bash nix-bundle
```

```bash
nix-build multitool.nix

nix-bundle 
```

## Resources

https://github.com/NixOS/bundlers