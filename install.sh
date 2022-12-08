#!/bin/bash

USER=dev

apt update
apt install -y build-essential python3 python3-dev python3-pip
apt install -y nginx
apt install -y uwsgi uwsgi-plugin-python3
apt install -y logrotate

mkdir -p /etc/uwsgi/vassals
cp -r ./etc/uwsgi /etc

mkdir -p /var/log/uwsgi/vassals
chown -R $USER:$USER /var/log/uwsgi
chmod 755 /var/log/uwsgi/

cp ./etc/systemd/system/emperor.uwsgi.service /etc/systemd/system
cp ./etc/logrotate.d/uwsgi /etc/logrotate.d

yes | cp -f ./etc/nginx/nginx.conf /etc/nginx
yes | cp -f ./etc/nginx/sites-available /etc/nginx

su $USER

cp -r ./public-html ~

cp -r ./webapps/ ~
sudo ln -s ~/webapps/helloworld/helloworld.ini /etc/uwsgi/vassals/helloworld.ini
( cd ~/webapps/helloworld ; python3 -m venv .venv )

sudo systemctl start emperor.uwsgi.service
sudo systemctl enable emperor.uwsgi.service

sudo nginx -s reload
sudo systemctl reload nginx





