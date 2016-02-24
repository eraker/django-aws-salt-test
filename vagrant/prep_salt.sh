#!/bin/bash
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sh install_salt.sh
echo "file_client: local" >> /etc/salt/minion
mkdir /srv/salt
cp -r /opt/saltings/* /srv/salt


# Apache2 is getting installed and running. Stop that.

# Need to create a database?
# Need to copy secrets file to remote && set SECRETS_LOCATION env var

# run `sudo salt-call --local state.highstate -l debug`

# Need to start application
