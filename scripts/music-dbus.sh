#!/usr/bin/env bash

SONG=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk '/xesam:title/{getline; print}' | awk -F'\"' '{print $2}')
ARTIST=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk '/xesam:artist/{getline; getline; print}' | awk -F'\"' '{print $2}')
OUTPUT=""
ICON=""

if [ -n "$SONG" ]; then
    OUTPUT="$ARTIST - $SONG"
else
    OUTPUT=""
fi

echo "${OUTPUT}"

exit 0

