#!/bin/bash

installpath=/home/morris/bin/

cp ./backup_s3 $installpath
cp ./backup_daily $installpath
chmod +x "${installpath}backup_daily"
chmod +x "${installpath}backup_s3"

cfg=~/.config/systemd/user/
[ $XDG_CONFIG_HOME ] && cfg="${XDG_CONFIG_HOME}/systemd/user"
mkdir -p $cfg
cp backup_daily@.timer $cfg
cp start_backup@.service $cfg
