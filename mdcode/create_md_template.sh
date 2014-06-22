#!/bin/bash

DATE=$(date +%Y-%m-%d)
TIME=$(date +%Y-%m-%d %H:%M)

TITLE="$1"

cat << _EOF_ > content/"$DATE"-"$TITLE".md
Title: 
Date: $TIME
Modified: 
Category: 
Tags: 
Authors: meoow
_EOF_

