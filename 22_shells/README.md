# SHELLS

Demonstrate how to create and use custom shells.  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-custom-shells .
# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-custom-shells
```

## Build the package

```sh
nix-shell ./shell.nix 

echo ${MY_ENVIRONMENT_VARIABLE}
htop
which htop
```

## Resources

* Declarative and reproducible developer environments [here](https://nix.dev/tutorials/declarative-and-reproducible-developer-environments)
* pkgs.mkShell [here](https://ryantm.github.io/nixpkgs/builders/special/mkshell/)  
