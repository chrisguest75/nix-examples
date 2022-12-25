#!/usr/bin/env bash

function run_container() {
    local _imagename=$1
    shift
    local _entrypoint=$1
    shift
    # shellcheck disable=SC2068
    docker run --entrypoint "${_entrypoint}" "${_imagename}" $@
}

function run_container_volume() {
    local _imagename=$1
    shift
    local _entrypoint=$1
    shift
    # shellcheck disable=SC2068
    docker run --volume "$(pwd)/data:/data" --entrypoint "${_entrypoint}" "${_imagename}" $@
}

function run_container_volume_entrypoint() {
    local _imagename=$1
    shift
    local _entrypoint=$1
    shift 
    # shellcheck disable=SC2068 
    docker run --volume "$(pwd)/data:/data" --entrypoint "${_entrypoint}" "${_imagename}" $@
}
