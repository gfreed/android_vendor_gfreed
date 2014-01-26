#!/bin/bash

function fetch {
  export URL=$1
  export FILE=$(echo $URL | sed 's:.*/::')
  ( cd prebuilt/apps ; [ -f "$FILE" ] || wget "$URL" )
}

fetch 'https://f-droid.org/FDroid.apk'
