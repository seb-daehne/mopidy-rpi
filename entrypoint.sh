#!/bin/bash

# from: https://github.com/Darkade/slacktunes-mopidy/blob/master/entrypoint.sh

if [[ "$PULSE_COOKIE_DATA" != "" ]]
then
    echo -ne $(echo $PULSE_COOKIE_DATA | sed -e 's/../\\x&/g') >$HOME/pulse.cookie
    export PULSE_COOKIE=$HOME/pulse.cookie
fi

exec "$@"
