CIP
=========

Deploy INDIGO CIP service using the following procedure <br>


Requirements
------------

The service run as a container.

Role Variables
--------------

Dependencies
------------	


Deployment as container
--------------------

Image: Python:2 

```
$ docker run -td --name cip python:2
$ docker exec -it cip bash
(container) $ apt update
(container) $ apt install git vim wget
(container) $ git clone https://github.com/maricaantonacci/cloud-info-provider-deep && cd cloud-info-provider-deep
(container) $ pip install -r requirements.txt
(container) $ pip install -e .
(container) $ cloud-info-provider-service -h
/usr/local/lib/python2.7/site-packages/OpenSSL/crypto.py:14: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in the next release.
  from cryptography import utils, x509
usage: cloud-info-provider-service [-h] [--middleware MIDDLEWARE]
                                   [--format FORMAT] [--yaml-file YAML_FILE]
                                   [--template-dir TEMPLATE_DIR]
(container) $ pip install git+https://github.com/indigo-dc/bulksend2cmdb
```

Installation of grid-security certs

```
(container) $ cat /etc/apt/sources.list
...
#### #### EGI Trust Anchor Distribution ####
deb http://repository.egi.eu/sw/production/cas/1/current egi-igtf core
 
(container) $ wget -q -O - https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3 | apt-key add -
 
(container) $ apt-get update
(container) $ apt-get install ca-policy-egi-core
(container) $ ls /etc/grid-security/certificates/
-- list of certs
 
(container) $ cd /usr/local/share/ca-certificates
(container) $ for f in /etc/grid-security/certificates/*.pem ; do ln -s $f $(basename $f .pem).crt; done
(container) $ ls
-- list of certs
 
(container) $ update-ca-certificates
```

Installation of a new cert (es chain per Mesos)
```
(container) ### copy the certificate-chain.pem certs into /root/certs
(container) $ cp /root/certs/certificate-chain*.pem /usr/local/share/ca-certificates
(container) $ cd /usr/local/share/ca-certificates
(container) $ for f in /etc/grid-security/certificates/*.pem ; do ln -s $f $(basename $f .pem).crt; done
(container) $ update-ca-certificates
Updating certificates in /etc/ssl/certs...
x added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
 
(container) ### check certificates in /etc/ssl/certs
```


Populate CMDB from CIP
----------------------

#Create configuration files

##Files for Cloud provider
os.provider.yaml
```
(container) $ mkdir -p /root/provider/sites
(container) $ cat cat <<EOF >>/root/provider/sites/os.provider.yaml
site:
    name: Cloud
    id: provider_cloud
    is_public: false
    country: Italy
    country_code: IT
    roc: NGI_IT
    owner_contacts:
        -
    owner_contacts_iam:
        -
compute:
    total_cores: 0
    total_ram: 0
    max_dedicated_ram: 0
    min_dedicated_ram: 0
    accelerators_virt_type: UNKNOWN
    total_accelerators: 0
    max_accelerators: 0
    min_accelerators: 0
    hypervisor: UNKNOWN
    hypervisor_version: UNKNOWN
    service_production_level: production
    capabilities:
        - executionmanagement.dynamicvmdeploy
        - security.accounting
    failover: false
    live_migration: false
    vm_backup_restore: false
    endpoints:
        defaults:
            iam_enabled: true
            idp_protocol: openid
            region: sdds
            middleware_version: Rocky
            api_endpoint_technology: webservice
            api_authn_method: openid
            production_level: production
            federation:
              iotwins:
                issuer: https://iotwins-iam.cloud.cnaf.infn.it/
                protocol: openid
    shares:
        'ioTwins-TB01':
            auth:
                project_id: <>
                region_name: <>
            iam_organisation: TB01/cloud #IAM Group
            public_network_name: public
            private_network_name: tb01-net
    templates:
        defaults:
            platform: x86_64
            network: public
            network_in: undefined
            network_out: true
    images:
        defaults:
            os_type: Linux
            architecture: x86_64
            gpu_driver: 'NA'
            gpu_cuda_driver: 'NA'
            gpu_cudnn_driver: 'NA'
EOF
```

collect-push-cloud.sh
```
(container) $ cd /root/provider
(container) $ cat cat <<EOF >>collect-push-cloud.sh
#!/bin/bash
 
set -x
 
export CMDB_ENDPOINT_READ=
export CMDB_ENDPOINT_WRITE=
export CMDB_USER=
export CMDB_PASS=
 
################
##  Provider  ##
################
 
echo "***** Provider *****"
echo "Getting OpenStack data from Provider...."
 
## [Provider] CIP:Openstack with OIDC token
cloud-info-provider-service \
  --insecure \
  --all-images \
  --select-flavors private \
  --os-auth-type v3oidcaccesstoken \
  --os-protocol openid \
  --os-identity-provider iotwins \ # IAM organization
  --os-access-token $IAM_ACCESS_TOKEN \
  --os-auth-url <CLOUD_PROVIDER_API_V3_URL> \
  --os-project-domain-name default \
  --middleware openstack \
  --format cmdb \
  --yaml-file /root/iotwins-providers/sites/os.provider.yaml \
  --template-dir /root/cloud-info-provider-deep/etc/templates/ | bulksend2cmdb --cmdb-read-endpoint $CMDB_ENDPOINT_READ \
                                                                               --cmdb-write-endpoint $CMDB_ENDPOINT_WRITE \
                                                                               --cmdb-db-user $CMDB_USER \
                                                                               --cmdb-db-pass $CMDB_PASS
EOF
``` 
 

## Files for Mesos provider
mesos.provider.yaml
```
(container) $ cat cat <<EOF >>/root/provider/sites/mesos.provider.yaml 
site:
    name: mesos
    country: Italy
    country_code: IT
    is_public: False
    owner_contacts:
        -
    owner_contacts_iam:
        -
compute:
    accelerators:
        vendor: nvidia
        model: V100 # TITANX, TITANXSND
    endpoints:
        defaults:
            iam_enabled: true
            total_cores: 16
            federation:
              iotwins:
                issuer: https://iotwins-iam.cloud.cnaf.infn.it
                protocol: oidc
        https://<>/chronos:
            service_parent_id: https://<>/mesos
            local_volumes_host_base_path: /tmp
            # not GPU-enabled
            total_accelerators: 1
        https://<>/marathon:
            service_parent_id: https://<>/mesos
            load_balancer_ips: [<>]
            local_volumes_host_base_path: /tmp
            persistent_storage_drivers: []
            # not GPU-enabled
            total_accelerators: 1
EOF
``` 

collect-push-mesos.sh
``` 
(container) $ cd /root/provider
(container) $ cat <<EOF >>collect-push-mesos.sh
#!/bin/bash
 
set -x
 
export CMDB_ENDPOINT_READ=
export CMDB_ENDPOINT_WRITE=
export CMDB_USER=
export CMDB_PASS=
 
################
##  Provider  ##
################
 
echo "***** Provider *****"
echo "Getting Mesos data from Provider...."
 
## [Provider] CIP:Mesos with OIDC token
for endpoint in mesos marathon chronos; do
    echo "Getting Mesos data from https://<>/${endpoint}.."
    cloud-info-provider-service \
        --middleware mesos \
        --format cmdb \
        --mesos-cacert /etc/ssl/certs \
        --mesos-framework $endpoint \
        --mesos-endpoint https://<>/${endpoint} \
        --oidc-auth-bearer-token $IAM_ACCESS_TOKEN \
        --yaml-file /root/iotwins-providers/sites/mesos.provider.yaml \
        --template-dir /root/cloud-info-provider-deep/etc/templates/ | bulksend2cmdb --cmdb-read-endpoint $CMDB_ENDPOINT_READ \
                                                                                     --cmdb-write-endpoint $CMDB_ENDPOINT_WRITE \
                                                                                     --cmdb-db-user $CMDB_USER \
                                                                                     --cmdb-db-pass $CMDB_PASS
    echo ""
done
EOF
``` 
 
 
## Populate CMDB 

### Generate IAM Access Token
Generate a proper IAM Access Token 

### Execute collect-push
```
(container) $ ./collect-push-mesos.sh
or
(container) $ ./collect-push-cloud.sh
```


Information
-----------

iotwins-infn-cloud-support@lists.cnaf.infn.it
INFN Italy
