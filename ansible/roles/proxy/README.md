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
| letsencrypt_email | ""| Provide a valid email address for letsencrypt notifications
| domain_name | ""| DNS name of the node (needed for generating the certificates)
| proxy_certificate_path | /etc/letsencrypt/live/{{ domain_name }}/fullchain.pem| path to SSL certificate
| proxy_certificate_key_path | /etc/letsencrypt/live/{{ domain_name }}/privkey.pem| path to SSL certificate key
| proxy_trusted_certificate_path | /etc/letsencrypt/live/{{ domain_name }}/fullchain.pem| path to SSL certificate chain. 


Dependencies
------------



Author Information
------------------

Marica Antonacci (marica.antonacci@ba.infn.it) <br>
INFN Italy
