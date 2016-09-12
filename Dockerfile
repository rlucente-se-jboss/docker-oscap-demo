# This should be run from inside an properly configured instance
# of the Container Development Kit or OpenShift 3.x.

FROM registry.access.redhat.com/rhel6.8

MAINTAINER Rich Lucente <rlucente@redhat.com>

LABEL vendor="Red Hat"
LABEL version="0.1"
LABEL description="OpenSCAP scan of base RHEL 6 image"

# The first yum command populates the container channels from the
# host's RHSM configuration.  Using --disablerepo=* prevents any
# misconfigured channels from throwing an error.  The yum-config-manager
# commands ensure that only the desired channels are available.

RUN    yum repolist --disablerepo=* \
    && yum-config-manager --disable \* \
    && yum-config-manager --enable \
	   rhel-6-server-rpms \
           rhel-6-server-optional-rpms \
    && yum -y update \
    && yum install -y \
	   openscap \
           openscap-utils \
           openscap-content \
           scap-security-guide
ADD govready.sh /root/
ADD simple-script.sh /usr/local/bin
RUN chmod 0700 /root/govready.sh
RUN chmod a+rx /usr/local/bin/simple-script.sh

# run the security scan and remediation
RUN /root/govready.sh

# Make sure deployed container is unprivileged
USER 1000

# simple script so container doesn't immediately exit on deploy
CMD /usr/local/bin/simple-script.sh

