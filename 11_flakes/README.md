# FLAKES

Demonstrate how to use `nix flakes`.  

TODO:

* What is nix bundle?  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-flakes .
# debugging and host repo in build folder
docker run -v $(pwd)/..:/build -it --entrypoint /bin/sh nix-flakes    
``` 

```bash
cd 11_flakes

nix --help

nix flake new hello --extra-experimental-features nix-command --extra-experimental-features flakes

nix build --extra-experimental-features nix-command --extra-experimental-features flakes

nix flake --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Resources

https://github.com/the-nix-way/dev-templates

https://discourse.nixos.org/t/error-experimental-nix-feature-nix-command-is-disabled/18089

https://github.com/the-nix-way/nix-flake-dev-environments/tree/main

https://xeiaso.net/blog/nix-flakes-1-2022-02-21

https://blog.kubukoz.com/flakes-first-steps/

Nix flakes 
https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/
Nix
Nix Flakes - https://blog.kubukoz.com/flakes-first-steps/