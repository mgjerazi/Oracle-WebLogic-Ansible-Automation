# Oracle-WebLogic-Ansible-Automation

Ansible automation for WebLogic Domain

Start/Stop scripts for domain and VM

Ansible installed on a host

SSH access from Ansible Controller to FMW hosts

Ansible playbook for deploying a WebLogic 12c R2 Domain

You can connect to admin server on port 7001 using path

http://weblogic-ip:7001/console/login/LoginForm.jsp

username:weblogic

password:welcome1


Server start manually, inside domain path bin folder:

cd /oracle/Oracle_Home/WLS/user_projects


NodeManager:

nohup ./startNodeManager.sh > no_weblogic.log 2>&1 &

WebLogic:

nohup ./startWebLogic.sh > no_weblogic.log 2>&1 &


Playbook includes the following roles:

* wls-prereq
* java
* weblogic
* wls-domain

wls-prereq:

This role configures the Linux system with requirements to run the WebLogic domain

java:

This role configures the Linux system with JDK8 JDK rpm file needs to be inside path: roles/java/files

weblogic:

This role installs the Weblogic 12c R2 in Oracle Linux 7 Weblogic firmware needs to be inside path: roles/weblogic/files

wls-domain:

This role creates and configures a Domain with Weblogic Creates some initial configuration like boot.properties file


* Testing with Ansible:

ansible all -m ping -K

ansible --list-host all

ansible all -m ping


* Ansible Command:

ansible-playbook weblogic.yml -K


WLS Commands:

sudo firewall-cmd --add-port=7001/tcp --permanent

sudo firewall-cmd --reload

sudo iptables -L -n