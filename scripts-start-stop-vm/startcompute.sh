#!/bin/bash
. /home/opc/.oci/oci-curl.sh
oci-curl iaas.eu-frankfurt-1.oraclecloud.com POST /home/opc/.oci/empty.json /20160918/instances/$1?action=start