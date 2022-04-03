# scripts
Linux scripts and Ansible scripts from my CyberClass


Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

  https://github.com/life-is-what-you-make-it/scripts/blob/main/diagrams/Project1_Diagram.png 

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _ file may be used to install only certain pieces of it, such as Filebeat.
* https://github.com/life-is-what-you-make-it/scripts/blob/main/ansible/filebeat-playbook.yml
* https://github.com/life-is-what-you-make-it/scripts/blob/main/ansible/metricbeat-playbook.yml 

This document contains the following details:
* Description of the Topology 
* Access Policies 
* ELK Configuration 
    * Beats in Use 
    * Machines Being Monitored 
* How to Use the Ansible Build 
Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly _, in addition to restricting _ to the network.

* Load Balancers protect against denial of service attacks (DDoS) and analyzes the traffic coming in to determine what server to send the traffic. This prevents one server from getting overloaded with traffic because the load balancer allows traffic to be distributed evenly amongst the servers that are connected. It is also common for a load balancer to have a health probe that checks that the machine is working properly before sending traffic and if it isn't the load balancer will divert traffic from the malfunctioning server until the issue has been resolved. The jumpbox limits the access that the public has to your virtual network because in order to access the other virtual machines, you would need the private IPs of the machines and the private key thats stored inside the docker conatiner inside the jumpbox. A jumpbox allows greater control over access to a virtual network and its contents.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _ and system _.
* What does Filebeat watch for?  Filebeat looks for changes in files and when they occurred by looking at log files filebeat also organizes log files.

* What does Metricbeat record? Metricbeat records metrics from the operating system and services running on the server using Elasticsearch or Logstash, you can visualize the metrics and statistics that Metricbeat generates.

The configuration details of each machine may be found below.
Note: Use the Markdown Table Generator to add/remove values from the table.

Name	Function	IP Address	Operating System
================================================
Jump Box	Gateway & runs docker w/ansible	10.0.0.8	Linux
==================================================
Web-4	Web server used to rn DVWA	10.0.0.9	Linux
==================================================
Web-5	Web server used to rn DVWA	10.0.0.10	Linux 
===================================================
Elk 	Runs Elk container & Kibana	10.1.0.4	Linux
===================================================

Access Policies
The machines on the internal network are not exposed to the public Internet. 
Only the _ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
*  107.219.213.33  (my public IP)

Machines within the network can only be accessed by _.
* Jumpboxprovisioner 40.77.60.121

A summary of the access policies in place can be found in the table below.

Name	Publicly Accessible	Allowed IP Addresses
Jump Box	yes	107.219.213.33  
Web-4	No	10.0.0.8
Web-5	No	10.0.0.8

Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

It prevented me from having to configure ELK manually making the process easier. It also allowed for more control over what was being installed and performed on the machine.


The playbook implements the following tasks:
* The first task of the elk playbook installs docker.io on the Elk virtual machine
* Python is then installed on the Elk VM
* Elk requires more virtual memory so this task increases the memory to 262144
* This task tells the Elk machine use the 262144 as the amount of memory defined in the previous task
* Downloads, installs and executes the docker elk container on the Elk vm on restart so the elk container doesn't need to be manually started
* This enables docker on boot so you don't have to manually start docker when you turn your VM back on

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

https://github.com/life-is-what-you-make-it/scripts/blob/main/images/docker_ps_output.png 


Target Machines & Beats
This ELK server is configured to monitor the following machines:

* Web-4 10.0.0.9  web-5 10.0.0.10

We have installed the following Beats on these machines:

*  Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:

* Metricbeat shows statistics for the every process running on your system including memory, CPU usage, file system, Network IO and disk IO statics. To view the data collected, you would navigate to Kibana while you’re vm is running, select the system you'd like to review and from there can view the metrics of the system.
* Filebeat collects log information about the file system and specifies which files have been changed also when a file has been changed to either Elasticsearch or Logstash. If you wanted to see the output from filebeat, you would connect to Kibana and check the logs for any changes that have been made to the file system over a specific or more general time period. 

Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
SSH into the control node and follow the steps below:

* Copy the filebeat-config.yml file to /etc/ansible/filebeat-config.yml

* Update the filebeat-config.yml file to include host "10.1.0.4:9200" with username "elastic" and password "changeme" and setup.Kibana host to "10.1.0.4:5601"

* Run the playbook, and navigate to Kibana (Elk GUI interface) and click "Check Data" to check that the installation worked as expected

TODO: Answer the following questions to fill in the blanks:
* Which file is the playbook? Where do you copy it?

*  filebeat-playbook.yml
*  /etc/ansible/roles/filebeat.playbook.yml


* Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

* All private IP addresses that need to be accessed need to be added to the hosts file in order for them to allow a connection. We added 3 IP addresses 2 were web servers (10.0.0.9 & 10.0.0.10) and an elk server was added with IP 10.1.0.4. from there in the playbook file, navigate to "hosts" at the top of the file to specify whether you want the playbook installed on Elk or the Web servers, we also have to specify the host to the elk server for Filebeat so IP "10.1.0.4" is added to the config file to specify the location for installation.


* _Which URL do you navigate to in order to check that the ELK server is running?

*  http://51.13.100.56:5601/app/kibana 
