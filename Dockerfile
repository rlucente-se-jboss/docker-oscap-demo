FROM centos:6.6
CMD su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
CMD yum install -y openscap openscap-utils openscap-content scap-security-guide


