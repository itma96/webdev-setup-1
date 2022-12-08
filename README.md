# Base lxc container setup for multi-app django server with nginx & uwsgi.

## Prerequisites
os: Ubuntu 18.04.6 LTS
user with sudo privileges (default=dev)

## Setup (use root)
git clone & ./install.sh

## Config
nginx => /etc/nginx
uwsgi => /etc/uwsgi
logrotate => /etc/logrotate.d

apps root directory => /home/<USER>/webapps
server html root => /home/<USER>/public-html
