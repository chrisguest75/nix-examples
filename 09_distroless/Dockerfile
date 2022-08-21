FROM nixos/nix:latest AS BUILDER

WORKDIR /scratch
COPY jq.nix jq.nix
RUN nix-build ./jq.nix

CMD ["./result/bin/jq", "--version"]


# NOTE: Use this target to work out what to copy into scratch or distroless container.
FROM ubuntu:22.04 AS LDD

COPY --from=BUILDER /scratch/result/bin/ /bin/
RUN ldd /bin/jq

#FROM ubuntu:22.04 AS PRODUCTION
#FROM gcr.io/distroless/base AS PRODUCTION
FROM scratch AS PRODUCTION

COPY --from=BUILDER /scratch/result/bin/ /bin/

#COPY --from=BUILDER /nix /nix
COPY --from=BUILDER /nix/store/hnnp7jar4zmk84bp7ary246npzfbdsxv-jq-1.6-lib /nix/store/hnnp7jar4zmk84bp7ary246npzfbdsxv-jq-1.6-lib
COPY --from=BUILDER /nix/store/scd5n7xsn0hh0lvhhnycr9gx0h8xfzsl-glibc-2.34-210 /nix/store/scd5n7xsn0hh0lvhhnycr9gx0h8xfzsl-glibc-2.34-210
COPY --from=BUILDER /nix/store/fyzvck2f9bp6pqq58b36j0zbp5rk0vb2-onig-6.9.7.1 /nix/store/fyzvck2f9bp6pqq58b36j0zbp5rk0vb2-onig-6.9.7.1

CMD ["/bin/jq", "--version"]