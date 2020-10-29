# MIT Kerberos

## Using Password

```sh
docker-compose \
  -f ./docker-compose.krb5.yml \
  -f ./docker-compose.through.yml \
  exec through-password klist
```

```sh
docker-compose \
  -f ./docker-compose.krb5.yml \
  -f ./docker-compose.through.yml \
  exec through-password /bin/sh -c 'echo "keniac" | kinit eniac'
```

## Using PAM

```sh
docker-compose \
  -f ./docker-compose.krb5.yml \
  -f ./docker-compose.through.yml \
  exec through-pam klist
```

```sh
docker-compose \
  -f ./docker-compose.krb5.yml \
  -f ./docker-compose.through.yml \
  exec -u eniac through-pam /bin/sh -c 'su - johndoe' # kjohndoe
```

## Using Keytab

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/host -
FROM centos:7

RUN yum -y install krb5-workstation openssh-clients sshpass

RUN sed -i 's/^ default_ccache_name/# default_ccache_name/' /etc/krb5.conf

EOF
```

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h host \
  -v "$PWD"/services/through-keytab/krb5.conf.d:/etc/krb5.conf.d \
  -v "$PWD"/services/through-keytab/keytabs:/etc/security/keytabs \
  --name host \
  --net workbench \
  example/host:latest /bin/bash
```

```sh
#
klist

#
klist -etk /etc/security/keytabs/eniac.keytab

#
kinit -kt /etc/security/keytabs/eniac.keytab host/through-keytab@KRB5.LOCAL

#
sshpass -p 'keniac' ssh \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  eniac@through-keytab
```
