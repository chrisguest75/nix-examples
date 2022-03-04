# README

Demonstrate creating an `ffmpeg` image.


TODO:

* Install using .nix file
* mpeg_5
* Reduce image size

## Build and Run

```sh
# build ffmpeg 
docker build -t nix-ffmpeg .

# debugging
docker run -v $(pwd):/output -it --entrypoint /bin/sh nix-ffmpeg   
```

## Use ffmpeg

```sh
# show build 
docker run -v $(pwd):/output -it nix-ffmpeg 

# output a testcard 
docker run -v $(pwd):/output -it nix-ffmpeg ffmpeg -f lavfi -i testsrc=size=1920x1080 -t 20 -pix_fmt yuv420p -vf "drawtext=fontfile=/windows/fonts/arial.ttf:text='Testcard':fontcolor=white:fontsize=100" /output/testcard_1080p.mp4
```

https://www.youtube.com/watch?v=62m3GYEnZF4
https://github.com/NapoleonWils0n/cerberus/blob/master/nixpkgs/nixpkgs-package-manager.org