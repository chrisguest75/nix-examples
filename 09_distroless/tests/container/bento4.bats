#!/usr/bin/env bats
load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'
load 'test_helper/bats-file/load'

load "${BATS_TEST_DIRNAME}/functions.sh"  

setup() {
    if [[ -n $DEBUG_BATS ]]; then    
        INDEX=$((${BATS_TEST_NUMBER} - 1))
        echo "##### setup start" >&3 
        echo "BATS_TEST_NAME:        ${BATS_TEST_NAME}" >&3 
        echo "BATS_TEST_FILENAME:    ${BATS_TEST_FILENAME}" >&3 
        echo "BATS_TEST_DIRNAME:     ${BATS_TEST_DIRNAME}" >&3 
        echo "BATS_TEST_NAMES:       ${BATS_TEST_NAMES[$INDEX]}" >&3 
        echo "BATS_TEST_DESCRIPTION: ${BATS_TEST_DESCRIPTION}" >&3 
        echo "BATS_TEST_NUMBER:      ${BATS_TEST_NUMBER}" >&3 
        echo "BATS_TMPDIR:           ${BATS_TMPDIR}" >&3 
        echo "##### setup end" >&3 
    fi

    #rm -rf ./data/out
    #mkdir -p ./data/out
}

teardown() {
    if [[ -n $DEBUG_BATS ]]; then
        echo -e "##### teardown ${BATS_TEST_NAME}\n" >&3 
    fi
}

#IMAGENAME=nix-bento4-distroless
IMAGENAME=nix-bento4-scratch 
MP42HLS_ENTRYPOINT=/usr/bin/mp42hls

#*******************************************************************
#* mp42hls
#*******************************************************************

@test "check mp42hls version" {
    run run_container ${IMAGENAME} ${MP42HLS_ENTRYPOINT}
    assert_output --regexp 'MP4 To HLS File Converter - Version 1.2'
}

