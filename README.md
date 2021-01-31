# README

TODO:
1) Add some examples of using nix to install software.  
1) Build a more complex docker image
1) Build a custom nix package
1) Understand the Nix language and API
1) Build a nix docker image inside a container
1) curl is broken in the docker images as it needs bundle.crt
1) How do I view dependencies of packages? 

## Install NIX

[Install-Nix](https://nixos.org/guides/install-nix.html)

Install vscode extension
```sh
code --install-extension bbenoist.Nix
```

Check a few things:

```sh
# check the daemon is running
systemctl status nix-daemon

# 
nix-env --help
```

## Example 0 - Nix Playground
Playground based on building nix in docker
Steps [README.md](./00_playground/README.md)   

## Example 1 - Simple NIX
Demonstrates how to build a python app in Nix  
Steps [README.md](./01_simple_python/README.md)   

## Example 2 - Single Package Docker Image
Demonstrates how to build a single package docker image in Nix  
Steps [README.md](./02_single_package_docker/README.md)   

## Example 3 - Multi Package Docker Image
Demonstrates how to build a multi package docker image in Nix
Steps [README.md](./03_multi_package_docker/README.md)   

## Example 4 - Installing Software
Demonstrates how to install software using nix package manager  
Steps [README.md](./04_instaling_software/README.md)   


## Resources

[Minimal Docker Images](https://jpetazzo.github.io/2020/04/01/quest-minimal-docker-images-part-3/)  
[Nix-by-example](https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55)  
  
