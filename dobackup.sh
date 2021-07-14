#!/bin/bash

localbackupdir=backup
serverdir=server
rconname=localhost:25575:minecraft

./minecraft-backup/backup.sh -c -i $serverdir -o $localbackupdir -s $rconname -w con -m 15 -d sequential

logfile=rclonelog.txt
rcloneremote1=upc
rcloneremote2=mega
destdir1=Share/mcserver
destdir2=mcserver

rclone sync $localbackupdir $rcloneremote1:$destdir1 --log-file=$logfile --log-level INFO -P

rclone sync $localbackupdir $rcloneremote2:$destdir2 --log-file=$logfile --log-level INFO -P
