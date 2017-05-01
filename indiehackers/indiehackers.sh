#!/bin/sh

MAIN_URL=https://www.indiehackers.com/businesses/

IDX=0
lynx --dump $MAIN_URL | grep "${MAIN_URL}" | awk '{ print $2 }' | while read LINK; do
  NAME=`echo $LINK | sed 's{https://www.indiehackers.com/businesses/{{g'`
  NUM=`awk "BEGIN { printf(\"%03d\", $IDX); }" < /dev/null`
  phantomjs ../render.js $LINK $NUM-$NAME.pdf
  IDX=$((IDX+1))
done
