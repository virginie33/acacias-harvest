# Docker script made with the help of
# http://blog.gemnasium.com/post/66356385701/your-dockerfile-for-rails
# -*- sh -*-
FROM debian:wheezy

# development tools
RUN apt-get update && apt-get -qy install git build-essential libpq-dev libv8-dev

#Prerequisits for ruby build
RUN  apt-get install -q -y \
  curl \
  patch \
  bzip2 \
  gawk \
  g++ \
  gcc \
  make \
  libc6-dev \
  patch \
  libsqlite3-dev \
  sqlite3 \
  libreadline6-dev \
  zlib1g-dev \
  libssl-dev \
  libyaml-dev \
  autoconf \
  libgdbm-dev \
  libncurses5-dev \
  automake \
  libtool \
  bison \
  pkg-config \
  libffi-dev

# Install Ruby 2.1.5
RUN mkdir /tmp/ruby && cd /tmp/ruby &&  \
  curl http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz | tar xz && \
  cd ruby-2.1.5 && \
  ./configure --disable-install-rdoc --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib --with-openssl-dir=/usr --with-readline-dir=/usr --with-zlib-dir=/usr && \
  make && \
  make install && \
  rm -rf /tmp/ruby

# Install bundler gem
RUN gem install bundler --no-ri --no-rdoc

# copy the Rails app
# we assume we have cloned the "docrails" repository locally
#  and it is clean; see the "prepare" script
RUN git clone https://github.com/simplonco/acacias.git /rails

# create a "rails" user
# the Rails application will live in the /rails directory
RUN adduser --disabled-password --home=/rails --gecos "" rails

# Make sure we have rights on the rails folder
RUN chown rails -R /rails

# copy and execute the setup script
# this will run bundler, setup the database, etc.
ADD docker_scripts/setup /setup
RUN chmod +x /setup
RUN su rails -c /setup

# copy the start script
ADD docker_scripts/start /start
RUN chmod +x /start

EXPOSE 3000
USER rails
CMD /start
