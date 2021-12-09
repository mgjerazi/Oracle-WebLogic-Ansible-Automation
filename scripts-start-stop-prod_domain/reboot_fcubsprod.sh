#!/bin/bash

#
# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
#

#Set env

# Reset the iptables to open the firewall ports on the local VM
# Access to ports is controlled from OCI Security rules

log_file="/u01/data/domains/scripts/FCUBS_PROD/logs/FCUBS_PROD_STARTUP.log"

BACKUPTIME=`date +%b-%d-%y-%H-%M-%S`
DESTINATION=/u01/data/domains/scripts/FCUBS_PROD/logs/FCUBS_PROD_STARTUP-$BACKUPTIME.log
if [ -f $log_file ]; then
    cp $log_file $DESTINATION
    rm -f $log_file
    touch $log_file
else
    touch $log_file
fi
sleep 0

function log() {
     while IFS= read -r line; do
         DATE=`date '+%Y-%m-%d %H:%M:%S.%N'`
         echo "$DATE ==> $line"
     done
}
echo "Restarting FCUBS PROD servers." | log >> $log_file
sudo su - oracle -c '/u01/data/domains/scripts/FCUBS_PROD/start.sh' >> $log_file 2>&1
echo "Executed server startup scripts." | log >> $log_file