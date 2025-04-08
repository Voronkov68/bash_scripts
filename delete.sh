#!/bin/bash

TRASHDIR="~/TRASH"
FILENAME="$1"
ARCHIVENAME="$FILENAME".gz

if [ $# -ne 1 ]
then
	echo "Please provide file name as an argument"
	exit 1
fi

mkdir -p $TRASHDIR

find $TRASHDIR -type f -mtime +2 -delete

if [ ! -f $FILENAME ]
then
	echo "File $FILENAME does not exist or not file"
	exit 1
fi

if [ -f $TRASHDIR/$ARCHIVENAME ]
then
	echo "file $ARCHIVENAME alredy exists, you cannot safety delete $FILENAME"
	exit 1
fi

gzip -c $FILENAME > $TRASHDIR/$ARCHIVENAME && rm $FILENAME || echo "Something  went wrong!"
