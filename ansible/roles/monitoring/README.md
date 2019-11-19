monitoring
=========

Deploy INDIGO Monitoring service using docker containers. <br>
The tasks included in the role are based on the Monitoring [guide](https://indigo-dc.gitbooks.io/monitoring/content/). <br>


Requirements
------------

The role should be used to deploy the INDIGO Monitoring pillar on two different machines:
 - the server node, running the Zabbix server
 - the agent node, running the Zabbix agent and the INDIGO Zabbix Wrapper
 <br>
 The integration with IAM requires:
 
 - a valid IAM user (that will be used to run the probes)
 - the registration of a client with grant type 'password'   
 


Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| monitoring_conf_dir | /etc/monitoring | Directory used to save the service configuration (env files for docker containers) 
| monitoring_zabbix_conf_dir | /etc/zabbix| Directory used to save the conf files of the Zabbix probes
| monitoring_mysql_user | zabbix| MySQL user 
| monitoring_mysql_password | changeit| MySQL password. <br> :boom: **Please change it otherwise the role will fail**
| monitoring_mysql_root_password | changeit| MySQL root password. <br> :boom: **Please change it otherwise the role will fail** 
| monitoring_zabbix_password | zabbix| Zabbix Admin password. <br> :boom: **Please change it otherwise the role will fail**
| monitoring_zabbix_wrapper_image | indigodatacloud/zabbix-wrapper:indigo_2 | Docker image for Zabbix Wrapper
| monitoring_zabbix_url | "http |//{{monitoring_server_host}}/api_jsonrpc.php"| 
| monitoring_agent_host | "{{ansible_default_ipv4.address}}"| Address of the Zabbix agent
| monitoring_server_host | "{{ groups['monitoring_server'][0] }}"| Address of the Zabbix server
| monitoring_cmdb_location | "https |//{{ groups['proxy'][0] }}/cmdb" | CMDB endpoint
| monitoring_iam_token_url | https://endpoint/token | IAM token endpoint
| monitoring_iam_username || IAM username
| monitoring_iam_password || IAM password
| monitoring_iam_client || IAM client ID
| monitoring_iam_secret || IAM client secret
| monitoring_iam_organization_name | | IAM organization name

Dependencies
------------

indigo-dc.docker


Author Information
------------------

Marica Antonacci (marica.antonacci@ba.infn.it) <br>
INFN Italy
