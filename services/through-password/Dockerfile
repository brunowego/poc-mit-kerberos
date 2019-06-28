FROM centos:7

RUN yum -y install krb5-workstation

RUN sed -i 's/^ default_ccache_name/# default_ccache_name/' /etc/krb5.conf

COPY ./krb5.conf.d/* /etc/krb5.conf.d/

CMD ["tail", "-f", "/dev/null"]
