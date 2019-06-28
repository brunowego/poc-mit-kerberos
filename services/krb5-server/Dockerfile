FROM centos:7

RUN yum -y install epel-release && \
    yum -y install krb5-server supervisor

RUN sed -i 's/^ default_ccache_name/# default_ccache_name/' /etc/krb5.conf

COPY ./krb5kdc/* /var/kerberos/krb5kdc/
COPY ./krb5.conf.d/* /etc/krb5.conf.d/

COPY ./supervisord.conf /etc
COPY ./supervisor.d/krb5.ini /etc/supervisor.d/

VOLUME ["/var/kerberos/krb5kdc"]

COPY ./docker-entrypoint.sh /sbin

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]

EXPOSE 88 749 9001

CMD ["/usr/bin/supervisord", "-nc", "/etc/supervisord.conf"]
