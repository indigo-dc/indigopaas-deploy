cpr
=========

Deploy INDIGO CPR service using docker containers. <br>
The tasks included in the role are based on the CPR [deployment guide](https://indigo-dc.gitbooks.io/cloud-provider-ranker/content/running.html).

Requirements
------------

-

Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| cpr_image            | indigodatacloud/cloudproviderranker:indigo_2 | Docker image used for running the service |


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
