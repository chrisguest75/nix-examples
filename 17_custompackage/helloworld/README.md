# BUILD CUSTOM PACKAGE

Demonstrate how to build a custom package.  

Example code comes from [cpp_examples](https://github.com/chrisguest75/cpp_examples/tree/main/01_helloworld_make)  

TODO:

* Open a shell that has access to the newly built package.  
* --add-root
* Prevent it from being garbage collected.

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-custom-package .
# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-custom-package  
```

## Build the package

```sh
# build the package
nix-build helloworld_17.nix

#execute it
./result/bin/helloworld 

# find it in /nix/store and query it. 
find / -type f -executable -name "helloworld"

# show dependencies
# NOTE: this is not building in a reproducible way.
nix-store --query --references /nix/store/193z2dc8slp7g95zjaczjalswd8l1j9z-simple-c-app-1.0.0/bin/helloworld


# THIS IS NOT WORKING
nix-store -qR $(nix-store -r $(nix-build helloworld_17.nix))
nix-shell -p helloworld_17
```

## Inspect

```sh
# 
echo $PROGRAM_FILE 
nix-store --query --references /nix/store/ii5kb178fv3v7fk0kzq5gms904n6ag72-helloworld-1.0.0/bin/helloworld

# 
LDD_PROGRAM=$(find / -type f -executable -name "ldd")
PROGRAM_FILE=$(find / -type f -executable -name "helloworld")
${LDD_PROGRAM} "$PROGRAM_FILE"
```

```sh
# delete unreachable store paths
nix-collect-garbage
```

## Resources

* What Is Nix [here](https://shopify.engineering/what-is-nix)  
