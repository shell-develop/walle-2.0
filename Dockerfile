FROM centos:7 
COPY ./libs/walle-web-alpha.zip /opt/walle-web-alpha.zip
RUN yum -y install epel-release \
    && yum makecache \
    && yum -y install openssl-devel openssl openssh-server mysql-devel gcc nginx* iproute unzip zlib* python-pip python-devel kde-l10n-Chinese glibc-common \ 
    && unzip /opt/walle-web-alpha.zip -d /opt/ \
    && mv /opt/walle-web-alpha /opt/walle \
    && rm /opt/walle-web-alpha.zip \
    && pip install --upgrade pip -i https://pypi.douban.com/simple \
    && pip install -r /opt/walle/requirements/prod.txt -i https://pypi.douban.com/simple \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && echo "* soft nofile 32768" >>/etc/security/limits.conf \
    && echo "* hard nofile 32768" >>/etc/security/limits.conf \ 
    && yum clean all && rm -rf /var/cache/yum \
    && rm -f /etc/localtime && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
