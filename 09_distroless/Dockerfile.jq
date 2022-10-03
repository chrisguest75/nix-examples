# syntax=docker/dockerfile:1.4
ARG baseimage="scratch"
FROM nixos/nix:latest AS BUILDER

ARG NIX_FILE=./jq.nix 
ARG PROGRAM_FILE=jq 

WORKDIR /scratch
COPY $NIX_FILE .
RUN nix-build $NIX_FILE

RUN find /nix/store -name "ldd" 

# NOTE: Escape the \$ otherwise they are rendered at buildtime
COPY <<EOF /scratch/exportldd.sh
#!/usr/bin/env bash
LDD_PROGRAM=/nix/store/h0cnbmfcn93xm5dg2x27ixhag1cwndga-glibc-2.34-210-bin/bin/ldd
AWK_PROGRAM=/nix/store/w3p77mkdy3pigg12iyha8y9dqakhjsxn-gawk-5.1.1/bin/awk
\${LDD_PROGRAM} "./result/bin/$PROGRAM_FILE" > /scratch/libs.txt
cat /scratch/libs.txt | \${AWK_PROGRAM} 'NF == 4 { {print \$3} }' > /scratch/libs_extracted.txt    
cat /scratch/libs_extracted.txt | \${AWK_PROGRAM} -F/ -vOFS=/ '{ print \$1,\$2,\$3,\$4; }' | sort -u > /scratch/libs_paths.txt
tar -cvf /scratch/libraries.tar -T /scratch/libs_paths.txt
mkdir -p /output/libs /output/bin
tar xf /scratch/libraries.tar --directory=/output/libs
cp "./result/bin/$PROGRAM_FILE" /output/bin
EOF
RUN chmod +x /scratch/exportldd.sh && /scratch/exportldd.sh
CMD ["./output/bin/$PROGRAM_FILE", "--version"]

FROM $baseimage AS PRODUCTION
#FROM scratch AS PRODUCTION
#FROM gcr.io/distroless/nodejs:16 AS PRODUCTION

COPY --from=BUILDER /output/bin /usr/bin
COPY --from=BUILDER /output/libs /

ENTRYPOINT [ "/usr/bin/jq" ]
CMD ["/usr/bin/jq", "--version"]
