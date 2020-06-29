#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "    Use:     dvserver-run.sh <image:tag> <volume name> <local path for mount inside container>"
    echo "             Parameter <image:tag> is mandatory."
    echo "             Parameters <volume name> and <local path for mount inside container> are optional."
    echo ""
    echo "    Example: dvserver-run.sh dvserver:2.3.10 dv_persistent_data /opt/datavirtuality/persistent_data"

elif [[ $# -eq 1 ]]; then
    img_to_run=$1

    docker run -d --name dvserver -h dvserver -p 8080:8080/tcp -p 31000:31000/tcp -p 31001:31001/tcp -p 35432:35432/tcp -p 35433:35433/tcp $img_to_run
elif [[ $# -eq 3 ]]; then
    img_to_run=$1
    volumename=$2
    local_path_mount=$3

    docker run -d --name dvserver -h dvserver -v $volumename:$local_path_mount -p 8080:8080/tcp -p 31000:31000/tcp -p 31001:31001/tcp -p 35432:35432/tcp -p 35433:35433/tcp $img_to_run
fi

