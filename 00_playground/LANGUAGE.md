# LANGUAGE

The language is pure, that is, its evaluation does not observe or interact with the outside world – with one notable exception: reading files, to capture what build tasks will operate on.

## 🏠 Build and Run

Build the docker container environment.  

```sh
# build nix
docker build -t nix-language .

# debugging and host repo in build folder
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix-language
```

## Play with language

```sh
mkdir -p ./out
```

### Expressions

```sh
echo 1 + 2 > ./out/file.nix
nix-instantiate --eval ./out/file.nix
```

### Strings

```sh
# upper a string
cat << EOF  > ./out/strings.nix
let
  pkgs = import <nixpkgs> {};
in
pkgs.lib.strings.toUpper "search paths considered harmful"
EOF

nix-instantiate --eval ./out/strings.nix
```

### Lambda

```sh
cat << EOF  > ./out/cowsay.nix
{ pkgs ? import <nixpkgs> {} }:
let
  message = "hello world";
in
pkgs.mkShell {
  buildInputs = with pkgs; [ cowsay ];
  shellHook = ''
    cowsay ${message}
  '';
}
EOF

echo 123 > ./out/data

nix repl
import ./out/cowsay.nix

"${./out/data}"

#exit
:quit 
```

## Resources

* Functions reference [here](https://nixos.org/manual/nixpkgs/stable/#sec-functions-library)
* Fetchers [here](https://nixos.org/manual/nixpkgs/stable/#chap-pkgs-fetchers)
* What is the purpose of nix-instantiate? What is a store-derivation? [here](https://stackoverflow.com/questions/31490262/what-is-the-purpose-of-nix-instantiate-what-is-a-store-derivation)
