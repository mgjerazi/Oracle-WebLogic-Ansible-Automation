domain_name = '{{ domain_name }}'
domain_home = '{{ domain_home }}'
weblogic_home = '{{ weblogic_home }}'
weblogic_template = weblogic_home + '/common/templates/wls/wls.jar'

#=======================================================================================
# Open a domain template.
#=======================================================================================

readTemplate(weblogic_template)

# Important domain configs
setOption('DomainName', domain_name)
setOption('ServerStartMode', 'prod')

#=======================================================================================
# Configure the Administration Server and SSL port.
#
# To enable access by both local and remote processes, you should not set the
# listen address for the server instance (that is, it should be left blank or not set).
# In this case, the server instance will determine the address of the machine and
# listen on it.
#=======================================================================================

cd('Servers/AdminServer')
set('Name', '{{ domain_admin_server }}')
set('ListenAddress','')
set('ListenPort', 7001)

# create('AdminServer','SSL')
# cd('SSL/AdminServer')
# set('Enabled', 'True')
# set('ListenPort', 7002)

#=======================================================================================
# Define the user password for weblogic.
#=======================================================================================

cd('/')
cd('Security/base_domain/User/weblogic')
# Please set password here before using this script, e.g. cmo.setPassword('value')
# cmo.setName('{{ weblogic_admin }}')
cmo.setPassword('{{ weblogic_admin_pass }}')

#=======================================================================================
# Create a JMS Server.
#=======================================================================================

# cd('/')
# create('myJMSServer', 'JMSServer')

#=======================================================================================
# Create a JMS System resource.

#=======================================================================================

# cd('/')
# create('myJmsSystemResource', 'JMSSystemResource')
# cd('JMSSystemResource/myJmsSystemResource/JmsResource/NO_NAME_0')

#=======================================================================================
# Create a JMS Queue and its subdeployment.
#=======================================================================================

# myq=create('myQueue','Queue')
# myq.setJNDIName('jms/myqueue')
# myq.setSubDeploymentName('myQueueSubDeployment')

# cd('/')
# cd('JMSSystemResource/myJmsSystemResource')
# create('myQueueSubDeployment', 'SubDeployment')

#=======================================================================================
# Create and configure a JDBC Data Source, and sets the JDBC user.
#=======================================================================================

# cd('/')
# create('myDataSource', 'JDBCSystemResource')
# cd('JDBCSystemResource/myDataSource/JdbcResource/myDataSource')
# create('myJdbcDriverParams','JDBCDriverParams')
# cd('JDBCDriverParams/NO_NAME_0')
# set('DriverName','org.apache.derby.jdbc.ClientDriver')
# set('URL','jdbc:derby://localhost:1527/db;create=true')
# set('PasswordEncrypted', 'PBPUBLIC')
# set('UseXADataSourceInterface', 'false')
# create('myProps','Properties')
# cd('Properties/NO_NAME_0')
# create('user', 'Property')
# cd('Property/user')
# cmo.setValue('PBPUBLIC')

# cd('/JDBCSystemResource/myDataSource/JdbcResource/myDataSource')
# create('myJdbcDataSourceParams','JDBCDataSourceParams')
# cd('JDBCDataSourceParams/NO_NAME_0')
# set('JNDIName', java.lang.String("myDataSource_jndi"))

# cd('/JDBCSystemResource/myDataSource/JdbcResource/myDataSource')
# create('myJdbcConnectionPoolParams','JDBCConnectionPoolParams')
# cd('JDBCConnectionPoolParams/NO_NAME_0')
# set('TestTableName','SYSTABLES')

#=======================================================================================
# Target resources to the servers.
#=======================================================================================

# cd('/')
# assign('JMSServer', 'myJMSServer', 'Target', 'AdminServer')
# assign('JMSSystemResource.SubDeployment', 'myJmsSystemResource.myQueueSubDeployment', 'Target', 'myJMSServer')
# assign('JDBCSystemResource', 'myDataSource', 'Target', 'AdminServer')

#=======================================================================================
# Write the domain and close the domain template.
#=======================================================================================

setOption('OverwriteDomain', 'true')
writeDomain(domain_home)
closeTemplate()

#=======================================================================================
# Exit WLST.
#=======================================================================================

exit()