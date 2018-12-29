# Requirements

The roles, in this first version, have been written for Ubuntu 16.04.

# Deployment scenario:



# Configure the control machine

- install ansible <br>Recommended installation path: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu

- install jmespath needed by jquery
  ````
  sudo apt install python-jmespath
  ````

- Distribute the ssh key to all the nodes

- Clone the repository
  ````
  git clone https://github.com/indigo-dc/indigopaas-deploy.git
  cd indigopaas-deploy/ansible
  ````

- Edit the file inventory/inventory replacing the IPs

````
[proxy]
172.30.24.3

[cmdb]
172.30.24.4

[slam]
90.147.75.144

[cpr]
172.30.24.4

[im]
172.30.24.5

[monitoring-server]
172.30.24.6

[monitoring-agent]
172.30.24.7

[orchestrator]
172.30.24.8

[monitoring:children]
monitoring-server
monitoring-agent

````

- Edit the variables in inventory/group_vars





  
