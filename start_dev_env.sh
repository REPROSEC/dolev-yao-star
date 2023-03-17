#!/usr/bin/env bash

set -e

# get the directory this script lives in (should be the first thing we do)
# https://stackoverflow.com/a/246128
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# Check whether docker is installed
if [ ! -x "$(command -v docker)" ]; then
    echo "Please install docker first."
    exit
fi

# Initialize variables for docker call
docker_image="foa3ucuvi85/fstar-ocaml-emacs:3.5-b8b1265a"
dy_home_host="${DIR}"
dy_home_container="/home/build/dolev-yao-star"

echo "Running ${docker_image} with DY_HOME=${dy_home_container}, mapped from ${dy_home_host}"
echo "Close emacs to stop the docker container."
echo ""

docker run -it \
       -e DISPLAY=:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -e XAUTHORITY=$XAUTHORITY -v $XAUTHORITY \
       -v "${dy_home_host}":"${dy_home_container}" \
       --env DY_HOME="${dy_home_container}" \
       --name=fstar-emacs \
       --rm --detach --net=host \
       "${docker_image}" \
       emacs "${dy_home_container}"

# open shell inside container
docker exec -it fstar-emacs /bin/bash -c "cd ${dy_home_container}; exec bash"
