#!/bin/bash
status="$(acpi -b | cut -d' ' -f3 | rev | cut -c 2- | rev)"
percent="$(acpi -b | cut -d' ' -f4)"
significant="$(echo $percent | tail -c 2)"
if [ "$significant" = ","  ]
then
  icon=""
  percnum="$(echo $percent | rev | cut -c 3- | rev)"
  if [ $percnum -lt 50 ] && [ $percnum -ge 25 ]
  then
    icon=""
  elif [ $percnum -lt 75 ] && [ $percnum -ge 25 ]
  then
    icon=""
  elif [ $percnum -ge 75 ]
  then
    icon=""
  fi
  battime="$(acpi -b | cut -d' ' -f5)"
  echo "$icon $percnum% $status $battime"
else
  echo " $percent $status"
fi
