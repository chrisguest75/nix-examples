
variable "TAG" {
  default = "latest"
}
variable "DISTROLESS" {
  default = "gcr.io/distroless/nodejs16-debian11"
}
variable "SCRATCH" {
  default = "scratch"
}

#***********************************************
# bento4 images
#***********************************************

target "bento4-image" {
  args = {"NIX_FILE":"bento4.nix", "PROGRAM_FILE":"mp42hls"}
  context = "."
  dockerfile = "Dockerfile.bento4"
}

target "bento4-image-distroless" {
  inherits = ["bento4-image"]
  args = {"baseimage":"${DISTROLESS}"}
  labels = {
    "org.opencontainers.image.title"= "nix-bento4-distroless:${TAG}"
  }
  tags = ["nix-bento4-distroless:${TAG}"]
}

target "bento4-image-scratch" {
  inherits = ["bento4-image"]
  args = {"baseimage":"${SCRATCH}"}
  labels = {
    "org.opencontainers.image.title"= "nix-bento4-scratch:${TAG}"
  }
  tags = ["nix-bento4-scratch:${TAG}"]
}

#***********************************************
# JQ images
#***********************************************

target "jq-image" {
  args = {"NIX_FILE":"jq.nix", "PROGRAM_FILE":"jq"}
  context = "."
  dockerfile = "Dockerfile.jq"
}

target "jq-image-distroless" {
  inherits = ["jq-image"]
  args = {"baseimage":"${DISTROLESS}"}
  labels = {
    "org.opencontainers.image.title"= "nix-jq-distroless:${TAG}"
  }
  tags = ["nix-jq-distroless:${TAG}"]
}

target "jq-image-scratch" {
  inherits = ["jq-image"]
  args = {"baseimage":"${SCRATCH}"}
  labels = {
    "org.opencontainers.image.title"= "nix-jq-scratch:${TAG}"
  }
  tags = ["nix-jq-scratch:${TAG}"]
}

#***********************************************
# SOX images
#***********************************************

target "sox-image" {
  args = {"NIX_FILE":"sox.nix", "PROGRAM_FILE":"sox"}
  context = "."
  dockerfile = "Dockerfile.sox"
}

target "sox-image-distroless" {
  inherits = ["sox-image"]
  args = {"baseimage":"${DISTROLESS}"}
  labels = {
    "org.opencontainers.image.title"= "nix-sox-distroless:${TAG}"
  }
  tags = ["nix-sox-distroless:${TAG}"]
}

target "sox-image-scratch" {
  inherits = ["sox-image"]
  args = {"baseimage":"${SCRATCH}"}
  labels = {
    "org.opencontainers.image.title"= "nix-sox-scratch:${TAG}"
  }
  tags = ["nix-sox-scratch:${TAG}"]
}

#***********************************************
# ffmpeg images
#***********************************************

target "ffmpeg-image" {
  args = {"NIX_FILE":"ffmpeg-full.nix", "PROGRAM_FILE":"ffmpeg"}
  context = "."
  dockerfile = "Dockerfile.ffmpeg"
}

target "ffmpeg-image-distroless" {
  inherits = ["ffmpeg-image"]
  args = {"baseimage":"${DISTROLESS}"}
  labels = {
    "org.opencontainers.image.title"= "nix-ffmpeg-distroless:${TAG}"
  }
  tags = ["nix-ffmpeg-distroless:${TAG}"]
}

target "ffmpeg-image-scratch" {
  inherits = ["ffmpeg-image"]
  args = {"baseimage":"${SCRATCH}"}
  labels = {
    "org.opencontainers.image.title"= "nix-ffmpeg-scratch:${TAG}"
  }
  tags = ["nix-ffmpeg-scratch:${TAG}"]
}

#***********************************************
# multitool images
#***********************************************

target "multitool-image" {
  args = {"NIX_FILE":"multitool.nix"}
  context = "."
  dockerfile = "Dockerfile.multitool"
}

target "multitool-image-distroless" {
  inherits = ["multitool-image"]
  args = {"baseimage":"${DISTROLESS}"}
  labels = {
    "org.opencontainers.image.title"= "nix-multitool-distroless:${TAG}"
  }
  tags = ["nix-multitool-distroless:${TAG}"]
}

target "multitool-image-scratch" {
  inherits = ["multitool-image"]
  args = {"baseimage":"${SCRATCH}"}
  labels = {
    "org.opencontainers.image.title"= "nix-multitool-scratch:${TAG}"
  }
  tags = ["nix-multitool-scratch:${TAG}"]
}

#***********************************************
# all images
#***********************************************

group "default" {
  targets = [
    "bento4-image-distroless", 
    "bento4-image-scratch",
    "jq-image-distroless", 
    "jq-image-scratch",
    "sox-image-distroless", 
    "sox-image-scratch",
    "ffmpeg-image-distroless", 
    "ffmpeg-image-scratch",
    "multitool-image-distroless", 
    "multitool-image-scratch"
    ]
}
