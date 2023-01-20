# FLAKES

Demonstrate how to use `nix flakes`.  

TODO:

* What is nix bundle?  

## 🏠 Build and Run

```sh
# build nix
docker build --no-cache -t nix-flakes .

# debugging and host repo in build folder
docker run -v $(pwd):/work -it --entrypoint /root/.nix-profile/bin/bash nix-flakes 

# inside container
nix --help
```

## Enabling flakes

```sh
find / -iname "nix.conf"

nix-shell -p nano

cat /etc/nix/nix.conf
nano /etc/nix/nix.conf
# add the following line
experimental-features = nix-command flakes

# or each command can use the overrides
nix flake new hello --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Creating Flakes

```sh
# 
cd ./hello-world

nix flake new hello-world

# forgot what imupure does
nix flake check
nix flake check --impure

nix build --impure

nix flake --help
```

```sh
nix repl

nix flake update

nix develop --impure
echo $SHLVL  
echo $PATH


nix flake show --impure

```

## Resources

* the-nix-way/dev-templates [here](https://github.com/the-nix-way/dev-templates)  
* Error: experimental Nix feature ‘nix-command’ is disabled [here](https://discourse.nixos.org/t/error-experimental-nix-feature-nix-command-is-disabled/18089)
* the-nix-way/nix-flake-dev-environments [here](https://github.com/the-nix-way/nix-flake-dev-environments/tree/main)
* Nix Flakes: an Introduction [here](https://xeiaso.net/blog/nix-flakes-1-2022-02-21)
* Nix from First Principles: Flake Edition [here](https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/)
* Nix Flakes: first steps [here](https://blog.kubukoz.com/flakes-first-steps/)
* Nix Language [here](https://nixos.org/manual/nix/stable/language/index.html)
* Nix Pills [here](https://nixos.org/guides/nix-pills/)

