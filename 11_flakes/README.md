# FLAKES

Demonstrate how to use `nix flakes`.  

TODO:

* What is nix bundle? 
* How do I just build flake without entering it?  Or if I enter it how do I then run all the tools I need? `nix run` `error: flake 'path:/work/jq' does not provide attribute 'apps.x86_64-linux.default', 'defaultApp.x86_64-linux', 'packages.x86_64-linux.default' or 'defaultPackage.x86_64-linux'`

NOTES:

* The `flake.lock` file lock to a specific revision of the nix pkg.  
* commits in nixpkgs [here](https://github.com/NixOS/nixpkgs/commits/master)  
* To lock to a retrospective version you can copy the commitid into the lock.  If you run `nix flake check --impure` you can copy the NAR hash to match.  

## 🏠 Build and Run

```sh
# build nix
docker build -f Dockerfile -t nix-flakes .

# debugging and host repo in build folder
docker run -v "$(pwd):/work" --rm -it --entrypoint /root/.nix-profile/bin/bash nix-flakes 

# inside container
nix --help

nix flake --help

# get version
nix-env --version
```

## Enabling flakes

NOTE: This is not required for the `Dockerfile` as it is done on `docker build`  

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

# check the validity of the flake
# NOTE: forgot exactly what imupure does (volatile output)
nix flake check
nix flake check --impure


nix build --impure
```

## Entering Flakes

```sh
cd ./ffmpeg5

# nix read evaluate print loop
nix repl

nix flake update

# enter flake
echo $SHLVL  
echo $PATH
nix develop --impure
echo $SHLVL  
echo $PATH

# show environments
nix flake show --impure
```

## ffmpeg 

Installing specific versions of ffmpeg.  

```sh
# inside the container
cd ./ffmpeg5.1.2
# enter (this will install)
nix develop --impure
# ffmpeg version 5.1.2
ffmpeg -version
```

```sh
cd ./ffmpeg4
# enter (this will install)
nix develop --impure
# ffmpeg version 4.4.3
ffmpeg -version
```

To a specific commit. To lock to a retrospective version you can copy the commitid from (nixos/nixpkgs) into the lock.  You can then run `nix flake check --impure` and copy the output conflicting NAR hash to match.  

```sh
# inside the container
cd ./ffmpeg5.1.1
# enter (this will install)
nix develop --impure
# ffmpeg version 5.1.1
ffmpeg -version
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





https://discourse.nixos.org/t/how-to-fix-a-nar-hash-mismatch/16594
