FROM iliyan/jenkins-ci-php:latest

RUN apt-get install software-properties-common
RUN apt-get install python3-software-properties
RUN apt-get install python-software-properties
RUN apt-get update
RUN apt-get install -y --force-yes software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update

RUN apt-get install -y --force-yes ruby2.1 ruby2.1-dev
RUN apt-get install -y --fix-missing --force-yes build-essential git libsqlite3-dev libssl-dev

RUN update-alternatives --set ruby /usr/bin/ruby2.1
RUN update-alternatives --set gem /usr/bin/gem2.1
RUN echo "gem: --no-rdoc --no-ri" >> /etc/gemrc
RUN gem install bundler

RUN gem install pkg-config -v "~> 1.1.7"

RUN gem install nokogiri -- --use-system-libraries
# [--with-xml2-config=/path/to/xml2-config]
# [--with-xslt-config=/path/to/xslt-config]

RUN apt-get install -y --force-yes libgcrypt11-dev zlib1g-dev
RUN gem install capistrano
RUN gem install jenkins-capistrano
RUN pear install [--alldeps] phing/phing
RUN pear install HTTP_Request2
ADD ./wait4jenkins.sh /wait4jenkins.sh
ADD ./configure.sh /configure.sh

RUN sh /configure.sh