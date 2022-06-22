proxy
=========

Install a reverse proxy based on nginx for 
- exposing the PaaS services through a single endpoint
- providing SSL termination. 

The role implements the automated creation of certificates using Let'sencrypt. 

Requirements
------------

The node to be configured as proxy needs to be registered in the DNS in order to generate the SSL certificates.

Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| letsencrypt_email | ""| Not used, but variable must be set
| domain_name | ""| Not used, but variable must be set


Dependencies
------------



Information
------------------

iotwins-infn-cloud-support@lists.cnaf.infn.it
INFN Italy
