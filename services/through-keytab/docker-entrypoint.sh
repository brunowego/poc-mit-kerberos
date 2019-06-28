#! /bin/sh
set -e

# useradd eniac

mkdir -p /etc/security/keytabs

if [ ! -f '/etc/security/keytabs/eniac.keytab' ]; then
  kadmin -w keniac -p eniac -q 'addprinc -randkey host/through-keytab'
  kadmin -w keniac -p eniac -q 'ktadd -k /etc/security/keytabs/eniac.keytab host/through-keytab'
fi

ssh-keygen -A

exec "$@"
