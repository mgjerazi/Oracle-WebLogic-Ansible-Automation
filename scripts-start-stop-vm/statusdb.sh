#!/bin/bash
source /home/opc/.oci/oci-curl.sh
oci-curl database.eu-frankfurt-1.oraclecloud.com POST /home/opc/.oci/empty.json /20160918/dbNodes/$1?action=stop