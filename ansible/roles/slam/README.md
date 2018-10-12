slam
=========

Deploy INDIGO CMDB service using docker containers. <br>
The tasks included in the role are based on the SLAM [deployment guide](https://indigo-dc.gitbooks.io/slam/installation.html).

Requirements
------------


Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| slam_mysql_image | mysql |5.7|
| slam_mysql_data_dir | /data/mysql|
| slam_mysql_root_password | changeit|
| slam_mysql_dbname | slam|
| slam_mysql_user | slam|
| slam_mysql_password | changeit|
| slam_mysql_host | localhost|
| slam_mongo_image | mongo|
| slam_mongo_data_dir | /data/mongo|
| slam_mongo_host | localhost|
| slam_mongo_db | slam|
| slam_image | indigodatacloud/slam |v2.0.0|
| slam_provider_email | ''|
| slam_iam_url | https |//iam.hostname|
| slam_iam_token_url | "{{slam_iam_url}}/token"|
| slam_iam_authorize_url | "{{slam_iam_url}}/authorize"|
| slam_iam_client_id ||
| slam_iam_client_secret ||
| slam_cmdb_url | http |//cmdb.hostname|
| slam_onedata_url | https |//onedata.indigo-datacloud.eu|
| slam_keystore_password | changeit|
| slam_keystore_alias | slam|
| slam_keystore_path | /etc/slam/KeyStore.jks|

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
