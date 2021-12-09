#!/bin/bash

#Check if Node Manager running
echo "Checking current state of NodeManager..."
sleep 2
i=$(ps -ef|grep /u01/data/domains/prod_domain | grep weblogic.NodeManager |grep -v grep|wc -l)
          if [[ $i -gt 0 ]]; then
          echo "NodeManager is running"
                  sleep 2
         else
          echo "NodeManager is NOT running"
                  sleep 2
                fi

#Check if Admin Server is running
echo "Checking current state of FCUBS AdminServer..."
sleep 2
b=$(netstat -ltn | grep '7001'|wc -l)
         if [ $b -gt 0 ]; then
         echo "FCUBS AdminServer is running"
                 sleep 2
         else
        echo "FCUBS AdminServer is NOT running"
                sleep 2
        fi

#Check if Managed Server is running
 echo "Checking current state of FCUBS Managed Server..."
 sleep 2
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep fcubs_managed|wc -l)
         if [ $c -gt 0 ]; then
                 echo "FCUBS Managed server is running"
                                 sleep 2
         else
          echo "FCUBS managed server is NOT running"
                  sleep 1
                  fi

echo "Checking current state of GW Server..."
 sleep 2
c=$(ps -ef|grep 7001 | grep -v tail|grep -v grep|grep gw_server|wc -l)
         if [ $c -gt 0 ]; then
                 echo "GW server is running"
                                 sleep 2
         else
          echo "GW server is NOT running"
                  sleep 1
                  fi