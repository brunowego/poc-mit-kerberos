FROM centos:7

RUN yum -y install krb5-workstation openssh-server

RUN sed -i 's/^ default_ccache_name/# default_ccache_name/' /etc/krb5.conf && \
    sed -i 's/^#KerberosAuthentication .*/KerberosAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#KerberosTicketCleanup/KerberosTicketCleanup/' /etc/ssh/sshd_config

COPY ./krb5.conf.d/* /etc/krb5.conf.d/

COPY ./docker-entrypoint.sh /sbin

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
