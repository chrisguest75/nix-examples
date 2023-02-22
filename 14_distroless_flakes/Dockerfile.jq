# syntax=docker/dockerfile:1.4
ARG baseimage="scratch"
FROM nixos/nix:latest AS BUILDER

ARG FLAKE=jq 

WORKDIR /scratch

COPY --chmod=755 <<EOF /scratch/enable-flakes.sh
#!/usr/bin/env bash
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
EOF
RUN "/scratch/enable-flakes.sh"

COPY ./jq ./

# NOTE: Escape the \$ otherwise they are rendered at buildtime
COPY --chmod=755 <<EOF /scratch/exportldd.sh
#!/usr/bin/env bash
# Make sure these are dynamically discovered
LDD_PROGRAM=$(find / -type f -executable -name "ldd")
AWK_PROGRAM=$(find / -type f -executable -name "gawk")
JQ_PROGRAM=$(find / -type f -executable -name "jq")
mkdir -p /output/libs /output/bin

echo \$LDD_PROGRAM
echo \$AWK_PROGRAM
echo \$JQ_PROGRAM

while IFS=, read -r PROGRAM_FILE
do
    echo \$PROGRAM_FILE
    \${LDD_PROGRAM} "\$PROGRAM_FILE" > /scratch/libs.txt
    cat /scratch/libs.txt | \${AWK_PROGRAM} 'NF == 4 { {print \$3} }' > /scratch/libs_extracted.txt    
    cat /scratch/libs_extracted.txt | \${AWK_PROGRAM} -F/ -vOFS=/ '{ print \$1,\$2,\$3,\$4; }' | sort -u >> /scratch/libs_paths.txt
    cp "\$PROGRAM_FILE" /output/bin
done << PROGRAMS
\$JQ_PROGRAM
PROGRAMS

tar -cvf /scratch/libraries.tar -T /scratch/libs_paths.txt
tar xf /scratch/libraries.tar --directory=/output/libs
# remove includes and manpages (add this once tested - reduces image by 45MB)
find /output -iname "share" -or -iname "include" | xargs rm -rf
EOF

RUN nix develop --impure --command bash -c '/scratch/exportldd.sh'
 
CMD ["./output/bin/$PROGRAM_FILE", "--version"]

FROM $baseimage AS PRODUCTION

COPY --from=BUILDER /output/bin/ /usr/bin/
COPY --from=BUILDER /output/libs /

ENTRYPOINT [ "/usr/bin/jq" ]
CMD ["/usr/bin/jq", "--version"]
