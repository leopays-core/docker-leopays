#!/bin/sh

if [ ! "$LEOPAYS_ROOT" ]; then
    LEOPAYS_ROOT="/opt/leopays"
fi

cd $LEOPAYS_ROOT/bin

if [ ! -d "/data" ]; then
    mkdir /data
fi

if [ ! -f "/data/config.ini" ]; then
    cp /config.ini /data
fi

if [ -d "/contracts" ]; then
    if [ ! -d "/data/contracts" ]; then
        cp -r /contracts /data
    fi
fi

while :; do
    case $1 in
        --config-dir=?*)
            CONFIG_DIR=${1#*=}
            ;;
        *)
            break
    esac
    shift
done

if [ ! "$CONFIG_DIR" ]; then
    CONFIG_DIR="--config-dir=/data"
else
    CONFIG_DIR=""
fi

exec $LEOPAYS_ROOT/bin/leopays-node $CONFIG_DIR "$@"
