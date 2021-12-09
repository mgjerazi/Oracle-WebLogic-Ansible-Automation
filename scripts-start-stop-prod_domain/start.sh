#!/bin/bash

cd /u01/data/domains/scripts/FCUBS_PROD
#Check if Node Manager is started, and start NodeManager
echo "Checking current state of NodeManager"
i=$(ps -ef|grep /u01/data/domains/prod_domain | grep weblogic.NodeManager |grep -v grep|wc -l)
          if [[ $i -gt 0 ]]; then
          echo "NodeManager already running"
         else
          echo "Starting NodeManager Service"
        python -c 'import NODE; NODE.start_node_manager()'
         fi

#Check if Admin Server is started, and start AdminServer
echo "Checking current state of FCUBS AdminServer"
b=$(netstat -ltn | grep 7001|wc -l)
         if [ $b -gt 0 ]; then
         echo "FCUBS AdminServer is already running"
         else
          echo "Starting FCUBS AdminServer server"
          /u01/app/oracle/middleware/oracle_common/common/bin/wlst.sh /u01/data/domains/scripts/FCUBS_PROD/ADMN_start.py
         fi

#Check if Managed Server is started, and start Managed Server
 echo "Checking current state of FCUBS managed Server"
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep fcubs_managed|wc -l)
         if [ $c -gt 0 ]; then
                 echo "FCUBS PROD is running"
         else
          echo "Starting FCUBS PROD..."
          /u01/app/oracle/middleware/wlserver/common/bin/wlscontrol.sh -d prod_domain -r /u01/data/domains/prod_domain -c -f startManagedWebLogic.sh -s fcubs_managed START
        fi
echo "Checking current state of GW Server"
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep gw_server|wc -l)
         if [ $c -gt 0 ]; then
                 echo "GW server is running"
         else
          echo "Starting GW server..."
          /u01/app/oracle/middleware/wlserver/common/bin/wlscontrol.sh -d prod_domain -r /u01/data/domains/prod_domain -c -f startManagedWebLogic.sh -s gw_server START
                fi