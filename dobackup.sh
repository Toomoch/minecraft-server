#!/bin/bash
#this script backs up the whole server directory (not only worlds) and uploads it to two rclone remotes

localbackupdir=backup
serverdir=server
rconname=localhost:25575:minecraft

./minecraft-backup/backup.sh -c -i $serverdir -o $localbackupdir -s $rconname -w rcon -m 15 -d sequential

logfile=rclonelog.txt
rcloneremote1=drive
rcloneremote2=mega
destdir1=mcserver
destdir2=mcserver

rclone sync $localbackupdir $rcloneremote1:$destdir1 --log-file=$logfile --log-level INFO -P

rclone sync $localbackupdir $rcloneremote2:$destdir2 --log-file=$logfile --log-level INFO -P
