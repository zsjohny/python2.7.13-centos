FROM centos:centos6
LABEL MAINTAINER Johny Zheng <shun.johny@gmail.com>

WORKDIR /tmp

RUN yum -y install wget sqlite-devel xz gcc automake zlib-devel openssl-devel; yum clean all

# Install Python
RUN wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz && \
    tar xvf Python-2.7.13.tar.xz  && cd Python-2.7.13 && ./configure && make && make install &&  \
    rm -rf /tmp/{Python-2.7.13.tar.xz,Python-2.7.13}

RUN mv /usr/bin/python /usr/bin/python2
RUN ln -s /usr/local/bin/python2 /usr/bin/python
RUN sed -i 's@/usr/bin/python@/usr/bin/python2@g' /usr/bin/yum

# Install Pip
#https://www.liquidweb.com/kb/how-to-install-pip-on-centos-7/
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py

