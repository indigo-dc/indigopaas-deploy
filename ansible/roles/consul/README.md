Hashicorp Vault
===============

Deploy Hashicorp Vault service using docker containers.

Requirements
------------

-

Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
| vault_fqdn | vault.cloud.ba.infn.it | Host dns name
| vault_letsencrypt_email || let's encrypt email

Dependencies
------------

role: indigo-dc.docker

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: vault, x: 42 }

License
-------

Apache Licence v2

http://www.apache.org/licenses/LICENSE-2.0


Author Information
------------------
