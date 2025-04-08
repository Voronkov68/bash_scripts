#!/bin/bash

set -x #or bash -x ./script.sh pri zapuske

date=$(date "+%Y_%m_%d")
source_folder="/home/alexander/scripts"
destination_folder="/home/devops"
backup_path="$destination_folder"/backup-"$date.tar.gz"

if [ ! -d $source_folder ]
then
	echo "$source_folder does not exist or not a directory"
	exit 1
fi

if [ ! -d $destination_folder ]
then
	echo "$destination_folder does not exist or not a directory"
	exit 1

if tar -zcpf $backup_path $source_folder
then
	echo "Dtat from $source_folder was backed up succesfully"
	exit 0
else
	echo "En error occured during the backup"
	exit 1
fi



