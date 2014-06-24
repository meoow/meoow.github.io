#!/bin/bash

DATE=$(date +%Y-%m-%d)
TIME=$(date +'%Y-%m-%d %H:%M')

TITLE="${1:-untitled}"

FILE=content/"$DATE"-"$TITLE".md

cat << _EOF_ > "$FILE"
Title: $TITLE
Date: $TIME
Modified: 
Category: Article
Tags: 
Authors: meoow
Summary: 
_EOF_

${EDITOR:+vim} "$FILE"
