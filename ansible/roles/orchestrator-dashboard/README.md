Orchestrator dashboard
======================

Deploy INDIGO Orchestrator Dashboard service using docker containers

Requirements
------------

The PaaS services **CMBD**, **CPR**, **SLAM**, **IAM** and **Orchestrator** must be already installed.
Moreover, you need to register a client for the dashboard in IAM (redirect url: https://$DASHBOARDHOST:443/login/iam/authorized): the client ID and secret generated by IAM are used in the role through the following variables:
- dashboard_iam_client_id
- dashboard_iam_client_secret

If you enable vault integration, another IAM client is needed:
- dashboard_vault_iam_client_id
- dashboard_vault_iam_client_secret



Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| dashboard_fqdn | dashboard.cloud.ba.infn.it | Host dns name
| dashboard_image_name | indigodatacloud/orchestrator-dashboard | Orchestrator dashboard Docker image
| dashboard_iam_issuer | https://iam.hostname| IAM URL
| dashboard_iam_client_id || IAM client ID
| dashboard_iam_client_secret || IAM client secret
| dashboard_orchestrator_url | http://orchestrator.hostname | Orchestrator base url
| dashboard_tosca_template_repository_url | https://github.com/indigo-dc/tosca-types.git | Tosca templates repository
| dashboard_tosca_template_repository_dir | /opt | path to download tosca templates
| dashboard_tosca_templates_dir | /tosca-templates | tosca templates dir
| dashboard_tosca_parameters_dir | /tosca-parameters | tosca parameters dir
| dashboard_tosca_metadata_dir | /tosca-metadata | tosca metadata dir
| dashboard_slam_url | http://slam.hostname | SLAM base url
| dashboard_cmdb_url | http://cmdb.hostname | CMDB base url
| dashboard_administrators || Dashboard administrators list
| dashboard_letsencrypt_email || let's encrypt email
| dashboard_enable_db | false | Enable mysql database
| dashboard_mysql_image | mysql:5.7 | MySQL docker image
| dashboard_db_sql_file_url | https://raw.githubusercontent.com/maricaantonacci/orchestrator-dashboard/add_db/utils/orchestrator_dashboard.sql | Url for sql file
| dashboard_mysql_root_password | changeit | Dashboard Mysql root password <br> **Please change it otherwise the role will fail**
| dashboard_db_password | changeit | Dashboard Mysql user password <br> **Please change it otherwise the role will fail**|
| dashboard_enable_vault | false | Enable vault integration
| dashboard_vault_token: | | vault token to access to configure
| dashboard_vault_iam_client_id | | IAM client ID for Vault
| dashboard_vault_iam_client_secret | | IAM client Secret for vault

dependencies
------------

role: indigo-dc.docker

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: orchestrator-dashboard, x: 42 } 

License
-------

Apache Licence v2

http://www.apache.org/licenses/LICENSE-2.0


Author Information
------------------
