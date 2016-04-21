#!/bin/bash

i3status | while :
do
    read line
    if [ "$line" == "{\"version\":1}" ]
    then
        echo "$line" || exit 1
    elif [ "$line" == "[" ]
    then
        echo "$line" || exit 1
    elif [[ "$line" == ,* ]]
    then
        music=`sh ~/scripts/music-dbus.sh`
        line=`echo "$line"|cut -c 3-`
        echo ",[{\"name\":\"spotify\",\"full_text\":\"$music\"},$line" || exit 1
    else
        music=`sh ~/scripts/music-dbus.sh`
        if [ "$music" == "" ]
        then
            echo "$line"
        else
            line=`echo "$line"|cut -c 2-`
            echo "[{\"name\":\"spotify\",\"full_text\":\"$music\"},$line" || exit 1
        fi
    fi
done
