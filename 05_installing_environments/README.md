# README

Demonstrate how to define environments.  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-envs .
# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-envs
```

```sh
# install test-env
nix-env -f. -iA test-env -vvv
```

## Resources

* Declarative Package Management [here](https://nixos.org/manual/nixpkgs/stable/#sec-building-environment)  
