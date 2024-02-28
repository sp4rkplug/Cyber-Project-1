## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/chefesteve/Cyber_Project_1/blob/main/Images/project_1_diagram.drawio.png "Network Map")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

![Install ELK YAML](https://github.com/chefesteve/Cyber_Project_1/blob/main/Ansible/install_elk_playbook.txt "ELK YAML")

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
- Load balancer ensure balanced access between the servers to mitigate loss ov availibility in the event of mass traffic.
- Using a jumpbox allow me to automate tasks, and push changes to all servers at the same time.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the services and system logs.
- Filebeat monitors system logs and records any changes made.
- Metricbeat monitors system metrics and services and logs any unusual activity.

The configuration details of each machine may be found below.

| Name     | Function  | IP Address  | Operating System |
|----------|-----------|-------------|------------------|
| Jump Box |  Gateway  |  10.1.0.9   | Linux            |
| Web-1    | Webserver |  10.1.0.10  | Linix            |
| Web-2    | Webserver |  10.1.0.11  | Linux            |
| ELK VM   |Monitoring |  10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
- 76.58.3.22

Machines within the network can only be accessed by the jumpbox.
- The ELK machine can only be accessed by the jumpbox.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 76.58.3.22           |
| Web-1    | No                  | 10.1.0.9             |
| Web-2    | No                  | 10.1.0.9             |
| ELK VM   | No                  | 10.1.0.9             |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Both machines are updated with one command, mitigating the possibility of human error with multiple inputs.

The playbook implements the following tasks:
- Establishes a connection with the specified host or hosts.
- Downloads and installs a docker container along with python module.
- Increases virtual memory.
- Starts the container.
- Sets the container to run at startup.

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.1.0.10
- 10.1.0.11

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeats saves system logs to monitor logins, changes, etc.  Metricbeats collects service data and metrics, such as uptime.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to /etc/ansible.

![Filebeat Playbook](https://github.com/chefesteve/Cyber_Project_1/blob/main/Ansible/filebeat_playbook.txt)

- Update the hosts file to include your Webservers and ELK VM.

![Hosts](https://github.com/chefesteve/Cyber_Project_1/blob/main/Ansible/hosts.txt)

- Run the playbook, and navigate to Kibana (http://ELK-VM-IP:5601/app/kibana) to check that the installation worked as expected.
