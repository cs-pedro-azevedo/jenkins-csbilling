FROM jenkins

# Exposing needed ports
EXPOSE 8080
EXPOSE 50000

USER root
RUN usermod -u 500 jenkins

# Dependencies
RUN apt-get update
RUN apt-get -y install build-essential nodejs hping3 python2.7 npm

# Install Python and AWSCLI
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli

# Install NPM
RUN npm install -g npm

# Install Backup Plugin
RUN mkdir -p /var/jenkins_home/plugins/
RUN curl -O /var/jenkins_home/plugins/thinBackup.hpi https://updates.jenkins-ci.org/latest/thinBackup.hpi

# Get backups
RUN cd /
