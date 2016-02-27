#!/bin/bash
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sh install_salt.sh
echo "file_client: local" >> /etc/salt/minion
mkdir /srv/salt
cp -r /opt/saltings/* /srv/salt
pip install awscli --ignore-installed six
aws s3 cp --recursive s3://ekadanta/ .
mv ./secrets.yaml /opt/secrets.yaml
export SECRETS_LOCATION=/opt/secrets.yaml
salt-call --local state.highstate -l debug

# Need to start application
