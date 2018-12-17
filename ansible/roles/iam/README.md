IAM Role
=========

This role allows to deploy the INDIGO IAM service.

Requirements
------------

### Google Authentication
If you want to enable Google Auth you need to create a new client:

Access to Google developers console and create and configure a new credential project.

Go to: https://console.developers.google.com/apis/credentials

Create Credentials > OAuth Client ID

Application Type: Web Application

Name: Service Provider (SP) name

Let's assume that our server is iam.com:

Authorized JavaScript origins: https://iam.example.com.

Authorized redirect URIs: https://iam.example.com/openid_connect_login. Keep that in mind.

Copy client ID and client secret. You will need them for configuration.

### JSON web keys generation:

<pre>
git clone https://github.com/mitreid-connect/json-web-key-generator 
cd json-web-key-generator
docker run --rm -it -v $(pwd):/project -w /project maven mvn package && java -jar target/json-web-key-generator-0.4-SNAPSHOT-jar-with-dependencies.jar   -t RSA -s 1024 -S -i rsa1 -o keystore.jks
</pre>

The file _keystore.jks_ will be generated in the current directory with similar content:
<pre>
{
  "keys": [
    {
      "p": "0quqRBb9OZn5BOFO2oUnVjS2lUqP7vcPVJNBVHU0ONdD504oSSJNgbRahALpKXmeL1ufEbjuC0NqdKh78G6jBw",
      "kty": "RSA",
      "q": "qY4qjHhTcHlrVaxXEieb1ACenvxc-PCWFk92PqdkxKbZaXOd-WPFUvfyN48KCTCGFd_Qatk0ja0W5pXhibdFWw",
      "d": "HSHKAamFefAapUBHKySYLAR-0BY62hz1Bjx6ErbWlUpBWk2WmFjViKfSOMpMf_ZTqp8aUYjm9aahoaUBztNbGxz3oc9ElF39a7cMImWj_gJlyJM5Vg17ghamYmrdFnxIpF1nZQLQOrZJugVJDIHraBPZ79RquK5xze3ju7AOwpU",
      "e": "AQAB",
      "kid": "rsa1",
      "qi": "Ql4CFDPYvSZoKUXQp8-zj39q-JHpwR4FCHFIA1WwJIUG4FWvdg00oeZgdo3JgwmVGQBPqPtti9qYPWgHebFaMg",
      "dp": "zz2cM3tCA-YZ99kEzyZpuf4FFvvQd82GwTZS8BiUFM5-uA5Exxz9jfizimWqpOhE2mWRJ8f6NA5PrQ8JTU4pBQ",
      "dq": "WQWcj14JqQ8G7Ndsa8rCBSBCKAUmJ0nh81rLIYAv5xQXKEec1LiufK5TzRnb0hFZBRkay065Sf1r_asJ3I2N6w",
      "n": "i4hRoyfHVoXbisjVgA-g0Xt6gEDdOcoja6Ajm4Kr8Pku4JrH0IrbybGDEgbfK4PDUxpETRFj5kkj3vijEUpeT0e0OUNns1kdzr5rxhmyYyfibmMa2fMtqs8LrFD3BF6_B4UZ5zrIVUvI8xPl83pbczqMpZT6Z3g51Y-8WJJF1n0"
    }
  ]
}
</pre>

This file will be copied by the ansible role _iam_ to the remote node

References:
https://iam-docs.gitbooks.io/iam-documentation/content/v/develop/admin-guide/json_web_key.html




Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

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
