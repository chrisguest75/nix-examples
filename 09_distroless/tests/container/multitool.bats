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

#IMAGENAME=nix-multitool-distroless
IMAGENAME=nix-multitool-scratch  
FFMPEG_ENTRYPOINT=/usr/bin/ffmpeg
FFPROBE_ENTRYPOINT=/usr/bin/ffprobe
SOX_ENTRYPOINT=/usr/bin/sox


#*******************************************************************
#* ffmpeg
#*******************************************************************

@test "check ffmpeg version" {
    run run_container ${IMAGENAME} ${FFMPEG_ENTRYPOINT}
    assert_output --regexp 'ffmpeg version 5.0.1'
}

@test "check ffmpeg aac" {
    rm /data/out/file0000.aaclc.wav || true
    run run_container_volume ${IMAGENAME} ${FFMPEG_ENTRYPOINT} -nostdin -y -hide_banner -i /data/in/file0000.aaclc.m4a /data/out/file0000.aaclc.wav
    assert_file_exists ./data/out/file0000.aaclc.wav
    assert_output --regexp 'Input #0'
}

@test "check ffmpeg pcm" {
    rm /data/out/file0000.aaclc.pcm || true
    run run_container_volume ${IMAGENAME} ${FFMPEG_ENTRYPOINT} -nostdin -y -hide_banner -i /data/in/file0000.aaclc.m4a -f f32le -acodec pcm_f32le -ar 16000 /data/out/file0000.aaclc.pcm
    assert_file_exists ./data/out/file0000.aaclc.pcm
    assert_output --regexp 'Input #0'
}

@test "check ffmpeg hls" {
    rm ./data/in/concat.txt || true
    rm ./data/out/fileconcat.aaclc.m4a || true
    rm -rf ./data/out/hls || true
    mkdir -p ./data/out/hls || true
    cat << EOF  > ./data/in/concat.txt
    file file0000.aaclc.m4a
    file file0000.aaclc.m4a
    file file0000.aaclc.m4a
    file file0000.aaclc.m4a
    file file0000.aaclc.m4a
EOF
    ffmpeg -f concat -safe 0  -i ./data/in/concat.txt -acodec copy ./data/out/fileconcat.aaclc.m4a

    run run_container_volume ${IMAGENAME} ${FFMPEG_ENTRYPOINT} -y -hide_banner -i /data/out/fileconcat.aaclc.m4a -c:a aac -b:a 128k -muxdelay 0 -f segment -segment_time 6 -hls_flags append_list -hls_playlist_type event -segment_list /data/out/hls/main.m3u8 -segment_format mpegts /data/out/hls/main%d.ts
    assert_file_exists ./data/out/hls/main.m3u8 
    assert_output --regexp 'Input #0'
}

#*******************************************************************
#* ffprobe
#*******************************************************************

@test "check ffprobe version" {
    run run_container_volume_entrypoint ${IMAGENAME} ${FFPROBE_ENTRYPOINT} 
    assert_output --regexp 'ffprobe version 5.0.1'
}

@test "check ffprobe aac" {
    run run_container_volume_entrypoint ${IMAGENAME} ${FFPROBE_ENTRYPOINT} -v quiet -print_format json=compact=1 -show_streams /data/in/file0000.aaclc.m4a
    assert_output --regexp 'AAC \(Advanced Audio Coding\)'
}

#*******************************************************************
#* sox
#*******************************************************************

@test "check sox version" {
    run run_container_volume_entrypoint ${IMAGENAME} ${SOX_ENTRYPOINT} 
    assert_output --regexp 'SoX v14.4.2'
}

@test "check sox wav" {
    rm /data/out/file0000.aaclc.trim.wav || true
    run run_container_volume ${IMAGENAME} ${SOX_ENTRYPOINT} -nostdin -y -hide_banner -i /data/in/file0000.aaclc.m4a /data/out/file0000.aaclc.wav
    run run_container_volume_entrypoint ${IMAGENAME} ${SOX_ENTRYPOINT} -v 6 /data/out/file0000.aaclc.wav /data/out/file0000.aaclc.trim.wav trim 0 1
    assert_file_exists ./data/out/file0000.aaclc.trim.wav

    assert_output --regexp './data/out/file0000.aaclc.trim.wav'
}
