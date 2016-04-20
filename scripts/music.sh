#!/usr/bin/env bash

SONG=$(playerctl -p spotify metadata xesam:title)
ARTIST=$(playerctl -p spotify metadata xesam:artist)
OUTPUT=""
ICON=""

if [ -n "$(playerctl -p spotify status | grep -E 'Playing')" ]; then
    ICON="25b6"
elif [ -n "$(playerctl -p spotify status | grep -E 'Paused')" ]; then
    ICON="2161"
else
    ICON="2161"
fi

if [ -n "$SONG" ]; then
    OUTPUT="$ARTIST - $SONG"
else
    OUTPUT="-None-"
fi

echo "\u${ICON} ${OUTPUT} "

exit 0

