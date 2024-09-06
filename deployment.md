# Deployment Django App AWS
> How to deploy Django application AWS.

### Services:
- EC2
- PostgreSQL
- S3
- Domain
- SSL Setup

> Go to your EC2 terminal then follow the steps.

```bash
sudo apt update
sudo apt install python3-pip python3-dev nginx
sudo pip3 install virtualenv
sudo apt install python3-virtualenv
```

> Django application and create a virtual environment inside that directory.

```bash
git clone https://github.com/mbrsagor/bishasto.git
cd bishasto
virtualenv venv --python=python3.10
source venv/bin/activate
pip install -r requirements.txt
```

> Setting up our Django project

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic
deactivate
```

> Let’s create a system socket file for gunicorn now:
```bash
sudo vim /etc/systemd/system/gunicorn.socket
```
> Paste the contents below and save the file

```bash
[Unit]
Description=gunicorn socket
[Socket]
ListenStream=/run/gunicorn.sock
[Install]
WantedBy=sockets.target]
```

> Next, we will create a service file for gunicorn
```bash
sudo vim /etc/systemd/system/gunicorn.service
```
> Paste the contents below inside this file:

```bash
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/bishasto
ExecStart=/home/ubuntu/bishasto/venv/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          bishasto.wsgi:application
[Install]
WantedBy=multi-user.target
```

> Lets now start and enable the gunicorn socket
```bash
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket
```

> Before You create Nginx File.
```bash
cd /etc/nginx/sites-enabled
```

> You can delete the existing default file using the command.
```bash
sudo rm -f default
```

> Configuring Nginx as a reverse proxy
```bash
server {
    listen 80;
    server_name server_IP_here;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/ubuntu/bishasto;
    }

    location /media/ {
        root /home/ubuntu/bishasto;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}
```

> Activate the configuration using the following command:
```bash
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/
```

> Run this command to load a static file
```bash
sudo gpasswd -a www-data username
```

> Restart nginx and allow the changes to take place.
```bash
sudo systemctl restart nginx
sudo service gunicorn restart
sudo service nginx restart
```

> Additionally in case of errors
```bash
sudo tail -f /var/log/nginx/error.log
```

###### No needed if any errors
> To check nginx working fine
```bash
sudo systemctl status nginx
sudo fuser -k 8000/tcpsudo lsof -t -i tcp:8000 | xargs kill -9. 
```

> If Pycharm IDE django port already open kill the port for Ubuntu & MacOS
```bash
sudo lsof -t -i tcp:8000 | xargs kill -9
```

> Ref: https://www.codewithmuh.com/blog/deploy-django-application-on-ec2-with-postgresql-s3-domain-and-ssl-setup
> CI/CD: https://www.youtube.com/watch?v=NTqZ3S7xnjI
