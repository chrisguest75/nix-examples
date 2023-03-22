# BUILD CUSTOM PACKAGE

Demonstrate how to build a custom package.  

Example code comes from [cpp_examples](https://github.com/chrisguest75/cpp_examples/tree/main/01_helloworld_make)  


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
nix-build helloworld.nix

#execute it
./result/bin/helloworld 

# find it in /nix/store and query it. 
find / -type f -executable -name "helloworld"

# show dependencies
# NOTE: this is not building in a reproducible way.
nix-store --query --references /nix/store/193z2dc8slp7g95zjaczjalswd8l1j9z-simple-c-app-1.0.0/bin/helloworld
```

## Resources

* What Is Nix [here](https://shopify.engineering/what-is-nix)  
