FROM centos:6.6
CMD su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
CMD yum install -y openscap openscap-utils openscap-content scap-security-guide
CMD oscap xccdf eval --profile usgcb-rhel6-server \
    --results ~/usgcb-rhel6-server.xml \
    --report ~/usgcb-rhel6-server.html \
    --cpe /usr/share/xml/scap/ssg/content/ssg-rhel6-cpe-dictionary.xml \
    /usr/share/xml/scap/ssg/content/ssg-rhel6-xccdf.xml ; true

