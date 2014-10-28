FROM cjhardekopf/confd
MAINTAINER Amer Child <achild@basis.com>

# Update and install supervisor
RUN apt-get update && \
	apt-get install -y supervisor

# Get and install confd
# ADD https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-#amd64 /tmp
# RUN mv /tmp/confd-0.6.3-linux-amd64 /opt/confd && \
#	chmod a+x /opt/confd && \
#	mkdir -p /etc/confd/{conf.d,templates}

# Add the start script
# ADD start /opt/

# Install Patch
RUN apt-get install -y patch

# Install Apache 2
RUN apt-get install -y apache2

# Remove DEFAULT apache site
RUN rm -rf /var/www/html

# Make Bugzilla install Directory
ADD http://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-4.2.11.tar.gz /tmp/
RUN tar -xvf /tmp/bugzilla-4.2.11.tar.gz -C /var/www/
RUN ln -s /var/www/bugzilla-4.2.11 /var/www/html
# RUN 



