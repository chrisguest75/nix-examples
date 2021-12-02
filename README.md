# README

TODO:
1) [Pinning packages](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html)  
1) Build a custom nix package
1) Understand the Nix language and API
1) How do I view dependencies of packages? 
1) Understand if vulnerability detectors are just not seeing the issues.  What is vulnix?
1) These are some good examples - https://github.com/foggyubiquity/containizen  
1) Nix flakes https://nixos.wiki/wiki/Flakes.  Replacing nix-channels.

## Install NIX
NOTE: Or use [playground](##Example-0---Nix-playground) to test if you'd prefer not to install Nix

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

[NixPkgs](https://github.com/nixos/nixpkgs)  

## Example 0 - Nix playground
Playground based on building nix in Docker (doesn't require local Nix install)  
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

## Example 6 - Build Nix docker image in docker 
Building a Nix image inside a container  
Steps [README.md](./06_build_nix_in_docker/README.md)   

## Example 7 - Build Nix nodejs image in docker 
Building a Nix nodejs image
Steps [README.md](./07_build_nodejs_image/README.md)  

## Resources

[Minimal Docker Images](https://jpetazzo.github.io/2020/04/01/quest-minimal-docker-images-part-3/)  
[Nix-by-example](https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55)  
  
