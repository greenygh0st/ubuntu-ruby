FROM ubuntu:16.04

MAINTAINER Dale <dale@daleslab.com>

RUN apt update \
&& apt install -y wget git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#install rbenv
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
&& echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile \
&& echo 'eval "$(rbenv init -)"' >> ~/.bash_profile \
&& mkdir -p ~/.rbenv/plugins/ \
&& git clone https://github.com/greenygh0st/ruby-build.git ~/.rbenv/plugins/ruby-build \

&& echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile \
&& source ~/.bash_profile \

#install ruby
&& rbenv install -v 2.3.1 \
&& rbenv global 2.3.1 \
&& echo "gem: --no-document" > ~/.gemrc \
&& gem install bundler \

#install rails itself
&& gem install rails \
&& rbenv rehash
