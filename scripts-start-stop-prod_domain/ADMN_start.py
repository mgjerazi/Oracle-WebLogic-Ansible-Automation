import os, sys

def start_admn_server():
        try:
                print "Starting AdminServer"
                nmConnect('weblogic', 'welcome1', 'localhost', '5557','prod_domain','/u01/data/domains/prod_domain','SSL')
                prps = makePropertiesObject("-Dweblogic.log.RedirectStdoutToServerLogEnabled=true")
                nmStart('AdminServer',props=prps)
                print "AdminServer started."
        except Exception, e:
                print "AdminServerr startup failed. Process will be terminated"

start_admn_server()