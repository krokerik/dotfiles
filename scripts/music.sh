#!/usr/bin/env bash

SONG=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk '/xesam:title/{getline; print}' | cut -d '"' -f2)
ARTIST=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk '/xesam:artist/{getline; getline; print}' | cut -d '"' -f2)
STATUS=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | cut -d '"' -f2)

ICON=""
if [ -n "$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | cut -d '"' -f2 | grep -E "Playing")" ]; then
	ICON="25b6"
else
	ICON="2161"
fi
if [ -n "$SONG" ]; then
    echo "\u${ICON} $ARTIST - $SONG"
else
    OUTPUT="none"
fi

exit 0

