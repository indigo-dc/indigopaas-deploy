IAM Role
=========

This role allows to deploy the INDIGO IAM service.

Requirements
------------

### Google Authentication
If you want to enable Open ID Connect Auth you need to create a new client.

For example, for Google Auth access to Google developers console and create and configure a new credential project.

Go to: https://console.developers.google.com/apis/credentials

Create Credentials > OAuth Client ID

Application Type: Web Application

Name: Service Provider (SP) name

Let's assume that our server is iam.com:

Authorized JavaScript origins: https://iam.example.com.

Authorized redirect URIs: https://iam.example.com/openid_connect_login. Keep that in mind.

Copy client ID and client secret. You will need them for configuration.

Create the file application-oidc.yml, copying and pasting the client ID, client Secret and the IAM url

````yaml
oidc:
providers:
- name: google
  issuer: https://accounts.google.com
  client:
    clientId: <iam_google_client_id>
    clientSecret: <iam_google_client_secret>
    redirectUris: https://<iam_url>/openid_connect_login
    scope: openid,profile,email,address,phone
  loginButton:
    text: Google
    style: btn-social btn-google
    image:
      fa-icon: google
```

Role Variables
--------------

| Variable name  | Default Value | Description
| -------------- | ------------- |------------- |
|iam_fqdn | indigoiam.cloud.ba.infn.it | Host dns name
|iam_mysql_root_password | changeit | IAM Mysql root password
|iam_organization_name | indigo-dc | Organization name
|iam_logo_url| resources/images/indigo-logo.png | IAM instance logo
|iam_account_linking_disable| false | Disable account linking
|iam_mysql_image | mysql:5.7 | MySQL docker image
|iam_image | indigoiam/iam-login-service:v1.5.0.rc2-SNAPSHOT-latest | IAM Docker image
|iam_notification_disable | false | Disable IAM notifications
|iam_notification_from | iam@{{iam_fqdn}} | Notification mail sender
|iam_enable_oidc_auth | false | enable uthentication with OIDC provider
|iam_application_oidc_path | application-oidc.yml | OIDC configuration file
|iam_admin_email | "admin@{{iam_fqdn}}" | Administrator email address

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
