#!/bin/bash

DATE=$(date +%Y-%m-%d)
TIME=$(date +'%Y-%m-%d %H:%M')

TITLE="${1:-untitiled}"

FILE=content/"$DATE"-"$TITLE".rst

cat << _EOF_ > "$FILE"
$TITLE
###########
:date: $TIME
:modified: 
:category: Article
:tags: 
:authors: 
:summary: 
_EOF_

${EDITOR:+vim} "$FILE"
