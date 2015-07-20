FROM centos:6.6
RUN su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
RUN yum install -y openscap openscap-utils openscap-content scap-security-guide
COPY govready.sh /root/
RUN chmod +x /root/govready.sh
RUN /root/govready.sh
RUN ls /root/
