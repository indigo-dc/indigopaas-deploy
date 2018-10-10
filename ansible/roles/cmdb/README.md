cmdb
=========

Deploy INDIGO CMDB service using docker containers. 


Requirements
------------



Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| cmdb_conf_dir  | /etc/cmdb |  |
| cmdb_image     | indigodatacloud/cmdb:indigo_2      |
| cmdb_image     | indigodatacloud/cmdb:indigo_2      |
| cmdb_data_dir  | /data/cmdb      |
| cmdb_crud_username       | cmdb      |
| cmdb_crud_password       | changeit      |
| cmdb_crud_admin_group    | cmdb-dev-admins      |
| cmdb_oidc_userinfo       | https://iam-test.indigo-datacloud.eu/userinfo      |
| couchdb_image      | couchdb:1.6.1      |
| couchdb_data_dir      | /data/couchdb      |
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
