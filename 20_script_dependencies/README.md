# SCRIPT DEPENDENCIES

Demonstrate how to write scripts that pack their dependencies.  

NOTES:

* This is an amazing example of using multiple shebangs to ensure that dependencies are available.  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-script-dependencies .
# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-script-dependencies
```

## Build the package

```sh
./script.sh
```

## Resources

* Reproducible interpreted scripts [here](https://nix.dev/tutorials/reproducible-scripts#reproducible-scripts)  
