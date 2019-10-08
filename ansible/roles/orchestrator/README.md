orchestrator
=========

Deploy INDIGO Orchestrator service using docker containers. <br>
The tasks included in the role are based on the Orchestrator [deployment guide](https://github.com/indigo-dc/orchestrator/blob/master/gitbook/how_to_deploy.md).

Requirements
------------

Create a self-service protected resource for CLUES with the following scopes openid, profile, email, address,  phone, offline_access and token exchange enabled.<br>
Create a self-service protected resource for CLUES with the following scopes openid, profile, offline_access and enable token introspection.<br>
The Orchestrator uses INDIGO IAM authentication and INDIGO CMDB, CPR, SLAM, the Monitoring and Onezone. <br>

Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| orchestrator_conf_dir | /etc/orchestrator| Directory used to save the service configuration (env files for docker containers, application properties, ect.)
| orchestrator_mysql_image | mysql:5.7 | Docker image for running the DB |
| orchestrator_mysql_data_dir | /data/mysql| Directory used to save the DB data
| orchestrator_mysql_root_password | changeit| MySQL password for root.<br> :boom: **Please change it otherwise the role will fail**
| orchestrator_dbname | orchestrator| MySQL deployments database
| orchestrator_workflow_dbname | workflow| MySQL workflow database
| orchestrator_mysql_user | orchestrator| MySQL user 
| orchestrator_mysql_password | changeit| MySQL password <br> :boom: **Please change it otherwise the role will fail**
| orchestrator_mysql_host | 127.0.0.1| MySQL host
| orchestrator_dbport | 3306| MySQL port
| orchestrator_image | indigodatacloud/orchestrator:pr-286| Orchestrator docker image
| orchestrator_url | http |//localhost |8080| Self reference to the orchestrator REST interface
| orchestrator_im_url | "https://servproject.i3m.upv.es:8811"| IM REST endpoint
| orchestrator_cmdb_url | "http://indigo.cloud.plgrid.pl/cmdb"| CMDB REST endpoint
| orchestrator_slam_url | "http://indigo.cloud.plgrid.pl/slam"| SLAM REST endpoint
| orchestrator_cpr_url | "https://indigo-paas.cloud.ba.infn.it/cpr"| Cloud Provider Ranker (CPR) endpoint
| orchestrator_monitoring_url | "http://90.147.170.181"| Zabbix Wrapper endpoint
| orchestrator_onezone_url | "https://onezone.cloud.ba.infn.it:8443"| Endpoint of the default OneZone to which your OneData user is registered
| orchestrator_iam_issuer | https://iam-test.indigo-datacloud.eu/| IAM issuer
| orchestrator_iam_client_id | ""| Client ID of the IAM client registered for the orchestrator
| orchestrator_iam_client_secret | ""| Client Secret of the IAM client registered for the orchestrator
| orchestrator_clues_iam_client_id | ""| Client ID of the IAM client registered for CLUES
| orchestrator_clues_iam_client_secret | ""| Client Secret of the IAM client registered for CLUES
| disable_monitoring | False | disable monitoring installing monitoring-mock docker

Dependencies
------------

indigo-dc.docker

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }


Author Information
------------------

Marica Antonacci (marica.antonacci@ba.infn.it) <br>
INFN Italy
