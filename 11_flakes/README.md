# FLAKES

Demonstrate how to use `nix flakes`.  

TODO:

* What is nix bundle?  

## 🏠 Build and Run

```sh
# build nix
docker build --no-cache -t nix-flakes .   
# debugging and host repo in build folder
docker run -v $(pwd):/work -it --entrypoint /root/.nix-profile/bin/bash 
```

```bash
cd 11_flakes

nix --help

find / -iname "nix.conf"

nix-shell -p nano

cat /etc/nix/nix.conf
nano /etc/nix/nix.conf
# add the following line
experimental-features = nix-command flakes

# or each command can use the overrides
nix flake new hello --extra-experimental-features nix-command --extra-experimental-features flakes

# 
cd ./hello-world
nix flake new hello-world
nix flake check
nix flake check --impure

nix build --impure

nix flake --help


nix repl

nix flake update

nix develop --impure
echo $SHLVL  
echo $PATH


nix flake show --impure


```

## Resources

https://github.com/the-nix-way/dev-templates

https://discourse.nixos.org/t/error-experimental-nix-feature-nix-command-is-disabled/18089

https://github.com/the-nix-way/nix-flake-dev-environments/tree/main

https://xeiaso.net/blog/nix-flakes-1-2022-02-21


Nix flakes 
https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/
Nix
Nix Flakes - https://blog.kubukoz.com/flakes-first-steps/

https://nixos.org/manual/nix/stable/language/index.html

https://nixos.org/guides/nix-pills/

