#!/usr/bin/env bash
#
# Copyright (c) 2020, Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
#
log_file="/u01/data/domains/scripts/FCUBS_PROD/logs/FCUBS_PROD_SHUTDOWN.log"
sudo su - oracle -c '/u01/data/domains/scripts/FCUBS_PROD/stop.sh' >> $log_file 2>&1