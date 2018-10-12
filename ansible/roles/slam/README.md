slam
=========

Deploy INDIGO CMDB service using docker containers. <br>
The tasks included in the role are based on the SLAM [deployment guide](https://indigo-dc.gitbooks.io/slam/installation.html).

Requirements
------------

SLAM uses INDIGO IAM authentication and INDIGO CMDB as configuration data source. <br>
Before deploying SLAM, you need to have a running instance of IAM and CMDB. <br>
Moreover, you need to register a client for SLAM in IAM (redirect url: https://$SLAMHOST:8443/auth): the client ID and secret generated by IAM are used in the role through the following variables:
- slam_iam_client_id
- slam_iam_client_secret


Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| slam_mysql_image | mysql:5.7| Docker image for running the relational DB
| slam_mysql_data_dir | /data/mysql| Persistent data dir for mysql
| slam_mysql_dbname | slam| SLAM Mysql DB name
| slam_mysql_user | slam| SLAM Mysql user name
| slam_mysql_password | changeit| SLAM Mysql user password <br> **Please change it otherwise the role will fail**
| slam_mysql_host | localhost| Mysql host
| slam_mongo_image | mongo| Docker image for running the document-oriented DB
| slam_mongo_data_dir | /data/mongo| Persistent data dir for mongo
| slam_mongo_host | localhost| Mongo host
| slam_mongo_db | slam| SLAM Mongo DB name 
| slam_image | indigodatacloud/slam:v2.0.0| SLAM docker image
| slam_provider_email | ''| SLAM provider email 
| slam_iam_url | https://iam.hostname| IAM URL 
| slam_iam_token_url | "{{slam_iam_url}}/token"| IAM token endpoint
| slam_iam_authorize_url | "{{slam_iam_url}}/authorize"| IAM authorize endpoint
| slam_iam_client_id || IAM client ID 
| slam_iam_client_secret || IAM client secret
| slam_cmdb_url | http://cmdb.hostname| CMDB base url  
| slam_onedata_url | https://onedata.indigo-datacloud.eu| Onedata URL
| slam_keystore_password | changeit| Password for keystore <br> **Please change it otherwise the role will fail**
| slam_keystore_alias | slam| Alias for identifying the SLAM entry in the keystore 
| slam_keystore_path | /etc/slam/KeyStore.jks| Local path to the keystore

Dependencies
------------

indigo-dc.docker

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: cmdb, x: 42 }


Author Information
------------------

Marica Antonacci (marica.antonacci@ba.infn.it) <br>
INFN Italy