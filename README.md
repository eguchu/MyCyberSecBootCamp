## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

- https://github.com/eguchu/MyCyberSecBootCamp/blob/main/network%20diagrams/cloud%20network%20security%20v1.0.png


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible config file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system metrics such as uptime and cpu usage.


| Name      | Function               | IP Address |  Operating System |
|-----------|------------------------|------------|-------------------|
| Jump Box  | Gateway                | 10.0.0.4   | Linux             |
| Web 1     | DVWA 1                 | 10.0.0.9   | Linux             |
| Web 2     | DVWA 2                 | 10.0.0.10  | Linux             |
| Web 3     | DVWA 3                 | 10.0.0.11  | Linux             |
| ELK Stack | Monitoring Web Servers | 10.1.0.4   | Linux             |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

13.90.248.83

Machines within the network can only be accessed by the Jump Box from its internal IP address 10.0.0.4




A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses                    |
|-----------|---------------------|-----------------------------------------|
| Jump Box  | Yes                 | 67.90.87.54 (Public IP of Admin Laptop) |
| ELK Stack | Yes                 | 67.90.87.54 (Public IP of Admin Laptop) |

NB: The Web servers 1,2,3 are configured as a HA backend server pool. These servers host the DVWA application and are accessible via HTTP using a public IP address 
hosted on the zone redundant load balancer. Access to the Web servers and the ELK stack is allowed via SSH only from the Jump Box from the Jump Box internal IP 10.0.0.4. All other access is denied.

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it reduces operator error, ensures server software/configuration consistency across a group of servers and it also significantly reduces the amount of time taken to deploy a large number of servers. 

 
The playbook implements the following tasks:

- Installs the docker.io image
- Installs the python3 docker module
- Increases virtual memory to meet ELK stack memory requirements
- Downloads and launches a docker elk container
- Updates SystemD daemon to start the docker service every time the elk server is booted


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/eguchu/MyCyberSecBootCamp/blob/main/screenshots/docker_ps_output.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.9
- 10.0.0.10
- 10.0.0.11

The following Beats are installed on these machines:
   
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat collects data about the file system and enables analysts to monitor files for suspicious changes.

- Metricbeat collects machine metrics such as CPU usage and and uptime. The information is used to alert analysts when system metrics are not ideal. Poor system metrics have the potential to impact services provided by the machine such as a web service for a front-end customer store application.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the install-elk.yml file to ansible.
- Update the hosts file in ansible to include the IP address of the ELK stack server.
- Run the playbook, and navigate to the kibana web page http://ip-address:5601/app/kibana#/home to check that the installation worked as expected.


