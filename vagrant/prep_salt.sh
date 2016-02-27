#!/bin/bash
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sh install_salt.sh
echo "file_client: local" >> /etc/salt/minion
mkdir /srv/salt
cp -r /opt/saltings/* /srv/salt
salt-call --local state.highstate -l debug
