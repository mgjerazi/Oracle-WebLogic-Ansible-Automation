#!/bin/bash

#Check if Managed Server is down, and stop Managed Server
 echo "Checking current state of FCUBS PROD"
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep fcubs_managed|wc -l)
         if [ $c -eq 0 ]; then
                 echo "FCUBS is down"
         else
          echo "Shutting down FCUBS ..."
          /u01/app/oracle/middleware/wlserver/common/bin/wlscontrol.sh -d prod_domain -r /u01/data/domains/prod_domain -c -f stopManagedWebLogic.sh -s fcubs_managed KILL
                fi

 echo "Checking current state of GW server"
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep gw_server|wc -l)
         if [ $c -eq 0 ]; then
                echo "GW server is down"
         else
          echo "Shutting down GW server ..."
          /u01/app/oracle/middleware/wlserver/common/bin/wlscontrol.sh -d prod_domain -r /u01/data/domains/prod_domain -c -f stopManagedWebLogic.sh -s gw_server KILL
         fi


#Check if Admin Server is down and stop AdminServer
echo "Checking current state of FCUBS PROD AdminServer"
b=$(netstat -ltn | grep 7001|wc -l)
         if [ $b -eq 0 ]; then
         echo "OBDX AdminServer is down"
         else
         echo "Shutting down FCUBS PROD AdminServer"
          /u01/data/domains/prod_domain/bin/stopWebLogic.sh
         fi

#Check if Node Manager is started, and stop NodeManager
echo "Shutting down NodeManager"
pid=$(ps axf |grep /u01/data/domains/prod_domain | grep weblogic.NodeManager | grep -v grep | awk '{print $1}')
kill -9 $pid
i=$(ps -ef|grep /u01/data/domains/prod_domain | grep weblogic.NodeManager |grep -v grep|wc -l)
          if [[ $i -eq 0 ]]; then
          echo "NodeManager shutdown completed"
         else
          echo "NodeManager shutdown failed"
         fi