## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/shivakashyap/cybersecurity/blob/master/Diagrams/Network%20Diagram%20-2%20.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Elk_Server_Playbook.yml 

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will have highly secure/available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? Load Balancers ensure that application always is available. Even if one node does down due to attack , the load balancer will get the other node up and running right away ensuring clients are always able to access application. 
- What is the advantage of a jump box? Jump box restricts the external access to the network of internal servers thereby restricting the point of contact and increasing the security. Also it can have container on it that can be used to deploy updates, upgrades, application management, patching etc. via ansible playbook scripts. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the configuration and system _____.
- filebeat: data about file system (e.g. sudo logins, login attempts etc.) 
- metricbeat: used for collecting machine metrics _

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function                                                     | IP Address | Availability Zone | Operating System |
| -------- | ------------------------------------------------------------ | ---------- | ----------------- | ---------------- |
| Jump Box | Gateway / Internal Network Access                            | 10.1.0.4   | NA                | Linux            |
| SK-1     | PROD1 - VM                                                   | 10.1.0.7   | 1                 | Linux            |
| SK-2     | PROD2 - VM                                                   | 10.1.0.6   | 1                 | Linux            |
| SK-3     | PROD1 BACKUP (HOT-HOT)                                       | 10.0.3.4   | 2                 | Linux            |
| SK-4     | PROD2 BACKUP (HOT-HOT)                                       | 10.0.3.5   | 2                 | Linux            |
| ELK      | Collect Logs from all machines and send to Kibana for log / issue management | 10.0.0.4   | 3                 | Linux            |



### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox and SK-VM's  can accept connections from the Internet. Access to these machines is only allowed from the following IP addresses:
- Jump Box / SK-VM's : As per my network security group settings for all machines i have allowed Port 80 access via any machine on INTERNET 

Machines within the network can only be accessed by _____.
- Which machine did you allow to access your ELK VM - Jump Box Provisioner
- What was its IP address - 10.1.0.4 (jump Box internal IP) 

A summary of the access policies in place can be found in the table below.

| Name                 | Accessible                                 | Allowed IP Addresses | Region | NSG         |
| -------------------- | ------------------------------------------ | -------------------- | ------ | ----------- |
| Jump Box             | via SSH from Vagrant VM                    | 13.82.67.46          | East   | RedFireWall |
| SK-1/ SK-2           | via SSH from Ansible Container on Jump Box | 10.1.0.7 / 10.1.0.6  | East   | RedFireWall |
| SK-3 / SK-4          | via SSH from Ansible Container on Jump Box | 10.0.3.4 / 10.0.3.5  | West   | Sk-3        |
| Elk                  | via Port 80 HTTP                           | 20.186.27.29         | East 2 | Elk         |
| Load Balancer - East | via Port 80 HTTP                           | 52.152.145.253       | East   | RedFireWall |
| Load Balancer - West | via Port 80 HTTP                           | 52.250.24.174        | West   | SK-3        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible - main advantage is that you can install same script on as many machines as needed in one go without needing to install versions on separate machines one at a time. 

The playbook implements the following tasks:
- _Configure elk server 

- Install python-pip

- Install docker.io

- install docker module

- increase virtual memory when logging into elk server

- download and load elk container 

  ​

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/shivakashyap/cybersecurity/blob/master/Pictures/Docker%20PS%20on%20ELK.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: 10.1.0.6 , 10.1.0.7, 10.0.3.4, 10.0.3.5 

  We have installed the following Beats on these machines:


- _TODO: filebeat and metricbeat _

These Beats allow us to collect the following information from each machine:
- filebeat - collects data about the file system e.g. logon country, sudo commands ran, 
- metricbeat - collect machine metrics e.g. uptime 
- ​

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
  - i have created multiple playbooks but to install the filebeat and metricbeat i placed the filebeat.yml and metricbeat.yml file in /etc/ansible folder. 
  - the playbook for installing elk (Elk_Server_Playbook.yml) on elkserver & fillebeat/metricbeat on webservers (filebeat-metricbeat-playbook.yml) , i have placed them in /etc/ansible/roles folder.  
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ 
  - This is accomplished by updating the hosts file for ansible. By clarifying webservers vs elkservers in my playbook and then outlining IP address of web vs elk servers, i can control which server gets filebeat installed on. 
- _Which URL do you navigate to in order to check that the ELK server is running?
  - http://20.186.27.29

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

to run playbook - ansible-playbook playbookname.yml

to download file - curl -L -O <fileaddress> 

to install file - sudo dpkg -i <filetobeinstalled>

to drop file in folder - drop in filebeat.yml (provide source and destination directory location)

to enable metricbeat docker - sudo metricbeat modules enable docker 





