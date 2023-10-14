# MyProject

> If you want to deploy the application cloud please follow the below instructions:

###### Install the Packages from the Ubuntu Repositories
```bash
sudo apt-get update
sudo apt-get install python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx
```

###### Create the PostgreSQL Database and User
```bash
sudo -u postgres psql
```

```postgresql
CREATE DATABASE project;
CREATE USER dev WITH PASSWORD '12345';
ALTER ROLE dev SET client_encoding TO 'utf8';
ALTER ROLE dev SET default_transaction_isolation TO 'read committed';
ALTER ROLE dev SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE pos TO dev;
\q
```

###### Create a Python Virtual Environment & run project
```bash
git clone https://github.com/mbrsagor/myproject.git
cd myposadmin
git checkout frontend
sudo apt install python3-virtualenv
virtualenv venv --python=python3.10
source venv/bin/activate
pip install -r requirements.txt
```
##### If not install gunicorn
```bash
pip install django gunicorn
```

#### Create a Gunicorn systemd Service File
````bash
sudo nano /etc/systemd/system/gunicorn.socket
````

```bash
[Unit]
Description=gunicorn socket

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target
```

> Next, we will create a service file for gunicorn

```bash
sudo vim /etc/systemd/system/gunicorn.service
```
```bash
Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/myproject
ExecStart=/home/ubuntu/myposadmin/venv/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          myposadmin.wsgi:application
[Install]
WantedBy=multi-user.target
```
> With this command, you can check if already a file exists.

```bash
cd /etc/nginx/sites-enabled
```
> Configuring Nginx as a reverse proxy
```bash
sudo vim /etc/nginx/sites-available/myadmin
```

```bash
server {
    listen 80;
    server_name IP_ADDRESS;
    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/ubuntu/myproject;
    }
    location /media/ {
        root /home/ubuntu/myproject;
    }
    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}
```
> Activate the configuration using the following command:
```bash
sudo ln -s /etc/nginx/sites-available/myposadmin /etc/nginx/sites-enabled/
```

> Run this command to load a static file
```bash
sudo gpasswd -a www-data ubuntu
```

> Restart nginx and allow the changes to take place.

```bash
sudo systemctl restart nginx
sudo service gunicorn restart
sudo service nginx restart
```

