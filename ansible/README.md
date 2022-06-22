![](https://img.shields.io/badge/tested%20with-ansible%202.8.6-green.svg)

# Deployment scenario:

![](doc/images/paas_deployment_schema.png)

# Requirements

The Ansible roles, in this version, have been written for Ubuntu 18.04.

Resource requirements for the IoTwins indigoPaaS deployment:

- 2 virtual machines with each 8 CPU, 8GB RAM, 100GB storage

- Cloud provider: Any

- EDGE provider: based on Mesos (see https://baltig.infn.it/IoTwins/mesos-edge)


# Configure the control node

- install ansible <br>Recommended installation path: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu

- install jmespath needed by jquery
  ````
  sudo apt install python-jmespath
  ````

- Distribute the ssh key to all the nodes

- Clone the repository
  ````
  git clone -b iotwins https://github.com/indigo-dc/indigopaas-deploy.git
  cd indigopaas-deploy-iotwins/ansible
  ````

- Edit the file inventory/inventory replacing the IPs

  ````
  [proxy]
  192.168.1.27 ansible_connection=local

  [cmdb]
  192.168.1.27 ansible_connection=local

  [slat]
  192.168.1.27 ansible_connection=local

  [cpr]
  192.168.1.27 ansible_connection=local

  [im]
  192.168.1.27 ansible_connection=local

  #[monitoring_server]
  #192.168.1.5

  #[monitoring_agent]
  #192.168.1.5

  [orchestrator]
  192.168.1.19

  #[monitoring:children]
  #monitoring_server
  #monitoring_agent

  [orchestrator_dashboard]
  192.168.1.27 ansible_connection=local
  ````

- For each service, fill its specific variables in the correspondig file present under inventory/group_vars as described in the README file of each service available under roles/ directory (https://github.com/indigo-dc/indigopaas-deploy/tree/iotwins/ansible/roles)

- Run the playbooks for each service you want to deploy.
  For each service, fill its specific variables in the correspondig file present under ansible/roles/<service>/defaults/main.yml as described in the README file of each service available under roles/ directory (https://github.com/indigo-dc/indigopaas-deploy/tree/iotwins/ansible/roles) 
  The recommended order is the following:
  ````
  ansible-playbook -i inventory/inventory playbooks/deploy-proxy.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-iam.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-cmdb.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-slat.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-cpr.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-im.yml
  #ansible-playbook -i inventory/inventory playbooks/deploy-monitoring.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-orchestrator.yml
  ansible-playbook -i inventory/inventory playbooks/deploy-orchestrator-dashboard.yml
  ````


## Special case: Installation, configuration, usage pf Cloud Info Provider (CIP) service

To install, configure and use the Cloud Info Provider (CIP) service to populate CMDB, please following the procedure described at [CIP installation and use](https://baltig.infn.it/IoTwins/indigopaas-deploy-iotwins/-/blob/main/ansible/roles/cip/README.md) 

## Troubleshooting

If running a playbook you get the following error:

```
fatal: [172.30.24.4]: FAILED! => {"msg": "Timeout (12s) waiting for privilege escalation prompt: "}
```

increase the timeout value in the file ansible.cfg and then re-run the playbook




  
