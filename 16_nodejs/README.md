# NODE BUILDS

Demonstrate the difference with the default nodejs, distrolesss and nix.  

TODO:

* Find the graph
* The nix image is so big because it is not currently multistage.  

## Use NodeVersion

```sh
nix-shell -p nodejs_22
```

## Build Image

Install `node16`.  

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug

# node
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=node--build-arg=PROGRAM_FILE=node --progress=plain -f Dockerfile.node16 --target BUILDER -t nix-flake-node16 .

docker run --rm -it nix-flake-node16 

# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint bash nix-flake-node16 

dive nix-flake-node16
```

## Outputs

| Images | Size |
| ------ | ---- |
| docker pull gcr.io/distroless/nodejs16-debian11:debug |    ~ 112MB |
| docker pull node:16-alpine3.16                        |    ~ 115MB |
| docker pull node:16.19.1-bullseye                     |    ~ 950MB |
| docker pull nix-flake-node16                          |    ~ 1.56GB |

## Resources
