# SHELLS

Demonstrate how to create and use custom shells and environments.  

## Reason

Installing a set of controlled dependencies for build systems or likewise.  

## 🏠 Build and Run

Prepare the environment in docker.  

```sh
# build nix
docker build -t nix-custom-shells .

# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-custom-shells
```

## Enter the shell

Use the `shell.nix` as an environment.  

### Impure

```sh
# show environment is not set
echo ${MY_ENVIRONMENT_VARIABLE}

# enter the shell (installs packages)
nix-shell ./shell.nix 

# show environment is set
echo ${MY_ENVIRONMENT_VARIABLE}
htop
which htop

# from parent environment
curl 
```

### Purity

Pure environments do not inherit from parent environment.  

```sh
# purity
nix-shell --pure ./shell.nix 

# no longer from parent environment
curl 
```

## Resources

* Declarative and reproducible developer environments [here](https://nix.dev/tutorials/declarative-and-reproducible-developer-environments)
* pkgs.mkShell [here](https://ryantm.github.io/nixpkgs/builders/special/mkshell/)  
