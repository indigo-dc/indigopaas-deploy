cmdb
=========

Deploy INDIGO CMDB service using docker containers. 


Requirements
------------



Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| cmdb_conf_dir            | /etc/cmdb |Directory used to save the service configuration (env files for docker containers) |
| cmdb_data_dir            | /data/cmdb | Directory used to save data
| couchdb_data_dir         | /data/couchdb  | Directory used to save the database data 
| couchdb_image            | couchdb:1.6.1      |
| cmdb_image               | indigodatacloud/cmdb:indigo_2      |
| cmdb_crud_username       | cmdb      | User for couchdb
| cmdb_crud_password       | changeit      | Password for couchdb. <br> **Please change it otherwise the role will fail**
| cmdb_crud_admin_group    | cmdb-dev-admins      |
| cmdb_oidc_userinfo       | https://iam-test.indigo-datacloud.eu/userinfo      | Openid-Connect userinfo endpoint
| cmdb_target_url          | http://localhost:5984/indigo-cmdb-v2/_design/schema/_rewrite      |
| cmdb_crud_target_url     |http://localhost:5984/indigo-cmdb-v2      |


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

Marica Antonacci (marica.antonacci@ba.infn.it)
INFN Italy
