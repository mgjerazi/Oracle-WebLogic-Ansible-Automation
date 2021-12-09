import os, sys
def stop_admn_server():
        try:
                print "Shutting down AdminServer."
                nmConnect('weblogic', 'welcome1', 'localhost', '5557','prod_domain','/u01/data/domains/prod_domain','SSL')
                nmKill('AdminServer')
                print "AdminServer shutdown."
        except Exception, e:
                print "AdminServer shutdown failed. Process will be terminated"

stop_admn_server()

