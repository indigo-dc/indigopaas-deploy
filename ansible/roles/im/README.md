im
=========

Deploy INDIGO Infrastruture Manager (IM) service using docker containers. <br> 
The tasks included in the role are based on the IM [deployment guide](https://indigo-dc.gitbooks.io/im/content/).

Requirements
------------


Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| im_conf_dir | /etc/im | Directory used to save the service configuration (env files for docker containers) 
| im_mysql_image | mysql | Docker image for running the relational DB
| im_mysql_data_dir | /data/mysql | Directory used to store the mysql data
| im_mysql_root_password | changeit | Password for mysql root user
| im_mysql_dbname | im | Mysql DB name
| im_mysql_user | im | Mysql user name
| im_mysql_password | changeit | Mysql user password
| im_mysql_host | 127.0.0.1 | Mysql host
| im_image | "indigodatacloud/im |{{im_image_version}}" | Docker image for running IM service
| im_image_version | 1.7.5 | Docker image version for IM
| im_repo_tag | "v{{im_image_version}}" | Tag for downloading the configuration file (im.cfg) from [Github](https://github.com/indigo-dc/im)
| im_conf_file | /etc/im/im.cfg | Path to the im.conf file (will be mounted in the container) 
| im_cfg_max_ctx_time | 28800 | Timeout for contextualization. <br> Set MAX_CONTEXTUALIZATION_TIME in im.cfg
| im_cfg_ansible_install_timeout | 500 | Max time expected to install Ansible in the master node. <br> Set ANSIBLE_INSTALL_TIMEOUT in im.cfg
| im_cfg_oidc_issuers | 'https |//iam-test.indigo-datacloud.eu/' | Supported OIDC issuers (can be a list). <br> Set OIDC_ISSUERS in im.cfg
| im_cfg_oidc_client_id || Set OIDC_CLIENT_ID in im.cfg | OIDC client ID of the IM service
| im_cfg_oidc_client_secret || OIDC client secret of the IM service

Dependencies
------------

indigo-dc.docker


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }


Author Information
------------------

Marica Antonacci (marica.antonacci@ba.infn.it) <br> 
INFN Italy
