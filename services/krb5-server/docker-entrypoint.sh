#! /bin/sh
set -e

if [ ! -f '/var/kerberos/krb5kdc/principal' ]; then
  kdb5_util -P "$KDB5_MASTER_PASSWORD" -r KRB5.LOCAL create -s

  kadmin.local -q 'addprinc -pw keniac eniac'
  kadmin.local -q 'addprinc -pw kjohndoe johndoe'
fi

exec "$@"
