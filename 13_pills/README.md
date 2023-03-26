# Pills

TODO:

* What is the difference between profiles and generations?  


NOTES:  

* In Nix, everything is an expression, there are no statements. This is common in functional languages.
* Values in Nix are immutable.

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-pills .
# debugging and host repo in build folder
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-pills
```

## Chapter 3. Enter the Environment

REF: [enter-environment](https://nixos.org/guides/nix-pills/enter-environment.html)  

### Generations

Shows a rollback.  

```sh
nix-env --list-generations

nix-channel --list
# update channels
nix-channel --update

# install hello and create new generation
nix-env -i hello

# run hello
hello

nix-env --list-generations

# rollback
nix-env --rollback

# cannot run hello
hello

nix-env --list-generations
```

## Repl

```sh
nix repl

1+3 
6/ 2

if 10 > 4 then "yes" else "no"


:help
The following commands are available:

  <expr>        Evaluate and print expression
  <x> = <expr>  Bind expression to variable
  :a <expr>     Add attributes from resulting set to scope
  :b <expr>     Build a derivation
  :bl <expr>    Build a derivation, creating GC roots in the working directory
  :e <expr>     Open package or function in $EDITOR
  :i <expr>     Build derivation, then install result into current profile
  :l <path>     Load Nix expression and add it to scope
  :lf <ref>     Load Nix flake and add it to scope
  :p <expr>     Evaluate and print expression recursively
  :q            Exit nix-repl
  :r            Reload all files
  :sh <expr>    Build dependencies of derivation, then start nix-shell
  :t <expr>     Describe result of evaluation
  :u <expr>     Build derivation, then start nix-shell
  :doc <expr>   Show documentation of a builtin function
  :log <expr>   Show logs for a derivation
  :te [bool]    Enable, disable or toggle showing traces for errors

```

## Chapter 6. Our First Derivation

REF: [our-first-derivation](https://nixos.org/guides/nix-pills/our-first-derivation.html)  

## Build

```sh
d = derivation { name = "myname"; builder = "mybuilder"; system = builtins.currentSystem; } 

:b d
```

## Resources

* Nix Pills [here](https://nixos.org/guides/nix-pills)

https://nixos.wiki/wiki/Cheatsheet

https://nixos.org/manual/nix/stable/language/builtins.html
 
https://nixos.org/guides/nix-pills/enter-environment.html
