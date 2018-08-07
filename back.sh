#!/bin/bash

backdir="/backup/phplog_bak"
num=5

mkdir -p $backdir > /dev/null 2>&1
chmod 700 $backdir

tar -zcvf $backdir/`date +%F`.phplog.tar.gz /data/logs/php >/dev/null 2>>/tmp/etc_bak.error
tar -zcvf $backdir/`date +%F`.nginxlog.tar.gz /data/logs/nginx >/dev/null 2>>/tmp/etc_bak.error

count=`ls -lt  $backdir/*.tar.gz | wc -l`

if [ $count -gt $num ]
then
        ls -lt  $backdir/*.tar.gz | tail -1 | awk '{print $9}' | xargs rm -f
fi
