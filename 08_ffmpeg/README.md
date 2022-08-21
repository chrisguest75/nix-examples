# README

Demonstrate creating an `ffmpeg` image with Nix.  

📝 TODO:

* mpeg_5 https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/libraries/ffmpeg/5.nix
* Reduce image size

## 🏠 Build and Run (builder)

```sh
# build ffmpeg 
docker build -f Dockerfile.builder -t nix-builder .

# create image
docker run -v $(pwd):/build -it nix-builder     

# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix-builder
nix-build ./ffmpeg-full.nix 
```

### 🏠 Load image into registry

```sh
# load image into local registry
docker load < ffmpeg-image

# should be most recent image
docker images

# show version
docker run -v $(pwd):/output -it ffmpeg ffmpeg
```

### 🔍 Inside build container

```sh
# jump into bash in container
docker run -v $(pwd):/output -it ffmpeg:latest ffmpeg -f lavfi -i testsrc=size=1920x1080 -t 20 -pix_fmt yuv420p -vf "drawtext=fontfile=/windows/fonts/arial.ttf:text='Testcard':fontcolor=white:fontsize=100" /output/testcard_1080p2.mp4
```

## ⚡️ Build and Run (fat image)

```sh
# build ffmpeg 
docker build -f Dockerfile.ffmpeg -t nix-ffmpeg .

# debugging
docker run -v $(pwd):/output -it --entrypoint /bin/sh nix-ffmpeg   
```

## ⚡️ Use ffmpeg

```sh
# show build 
docker run -v $(pwd):/output -it nix-ffmpeg 

# output a testcard 
docker run -v $(pwd):/output -it nix-ffmpeg ffmpeg -f lavfi -i testsrc=size=1920x1080 -t 20 -pix_fmt yuv420p -vf "drawtext=fontfile=/windows/fonts/arial.ttf:text='Testcard':fontcolor=white:fontsize=100" /output/testcard_1080p.mp4
```

## 👀 Resources

* ffmpeg 5 linux install with the nixpkgs package manager [video here](https://www.youtube.com/watch?v=62m3GYEnZF4)
* NapoleonWils0n/cerberus repo [here](https://github.com/NapoleonWils0n/cerberus/blob/master/nixpkgs/nixpkgs-package-manager.org)
* nixpkgs/pkgs/development/libraries/ffmpeg-full/default.nix [here](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/libraries/ffmpeg-full/default.nix)
* nixpkgs/pkgs/development/libraries/ffmpeg [here](https://github.com/NixOS/nixpkgs/tree/master/pkgs/development/libraries/ffmpeg)
