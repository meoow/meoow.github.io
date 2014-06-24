#!/bin/bash

DATE=$(date +%Y-%m-%d)
TIME=$(date +'%Y-%m-%d %H:%M')

TITLE="$1"

FILE=content/"$DATE"-"$TITLE".md

cat << _EOF_ > $FILE
Title: 
Date: $TIME
Modified: 
Category: Article
Tags: 
Authors: meoow
_EOF_

${EDITOR:+vim} $FILE
