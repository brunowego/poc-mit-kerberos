FROM centos:7

RUN yum -y install krb5-workstation pam_krb5

RUN sed -i 's/^ default_ccache_name/# default_ccache_name/' /etc/krb5.conf && \
    echo 'CHFN_RESTRICT yes' >> /etc/login.defs

COPY ./krb5.conf.d/* /etc/krb5.conf.d/
COPY ./pam.d/* /etc/pam.d/

RUN useradd eniac -p keniac && \
    useradd johndoe -p kjohndoe

CMD ["tail", "-f", "/dev/null"]
