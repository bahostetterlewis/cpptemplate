#!/usr/bin/env bash

set -e

function cleanup {
	sudo chown -R $USER:"$(id -g -n $USER)" $BUILD_OUTPUT_DIR
}

trap cleanup exit

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ROOT_DIR=$SCRIPT_DIR/..
PROJECT_DIR=$ROOT_DIR/project
DOCKER_DIR=$ROOT_DIR/Docker
BUILD_OUTPUT_DIR=$ROOT_DIR/build_output

pushd $DOCKER_DIR/build
docker build -t project_name/build .
popd 
pushd $DOCKER_DIR/test
docker build -t project_name/test .
popd
docker volume create project_name_ccache
docker run --rm -v $PROJECT_DIR:/project -v project_name_ccache:/root/.ccache project_name/test
