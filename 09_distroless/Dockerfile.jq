# syntax=docker/dockerfile:1.4
ARG baseimage="scratch"
FROM nixos/nix:latest AS BUILDER

ARG NIX_FILE=./jq.nix 

WORKDIR /scratch
COPY $NIX_FILE .
RUN nix-build $NIX_FILE

# NOTE: Escape the \$ otherwise they are rendered at buildtime
COPY <<EOF /scratch/exportldd.sh
#!/usr/bin/env bash
LDD_PROGRAM=/nix/store/h0cnbmfcn93xm5dg2x27ixhag1cwndga-glibc-2.34-210-bin/bin/ldd
AWK_PROGRAM=/nix/store/w3p77mkdy3pigg12iyha8y9dqakhjsxn-gawk-5.1.1/bin/awk
mkdir -p /output/libs /output/bin

while IFS=, read -r PROGRAM_FILE
do
    \${LDD_PROGRAM} "./result/bin/\$PROGRAM_FILE" > /scratch/libs.txt
    cat /scratch/libs.txt | \${AWK_PROGRAM} 'NF == 4 { {print \$3} }' > /scratch/libs_extracted.txt    
    cat /scratch/libs_extracted.txt | \${AWK_PROGRAM} -F/ -vOFS=/ '{ print \$1,\$2,\$3,\$4; }' | sort -u >> /scratch/libs_paths.txt
    cp "./result/bin/\$PROGRAM_FILE" /output/bin
done << PROGRAMS
jq
PROGRAMS

tar -cvf /scratch/libraries.tar -T /scratch/libs_paths.txt
tar xf /scratch/libraries.tar --directory=/output/libs
# remove includes and manpages (add this once tested - reduces image by 45MB)
find /output -iname "share" -or -iname "include" | xargs rm -rf
EOF
RUN chmod +x /scratch/exportldd.sh && /scratch/exportldd.sh
CMD ["./output/bin/$PROGRAM_FILE", "--version"]

FROM $baseimage AS PRODUCTION

COPY --from=BUILDER /output/bin/ /usr/bin/
COPY --from=BUILDER /output/libs /

ENTRYPOINT [ "/usr/bin/jq" ]
CMD ["/usr/bin/jq", "--version"]
