> RUn the nginx server in your own ports
```bash
docker run -d -p 8080:80 nginx:latest
```

> Stop the container
```bash
docker stop container_ID
```

> Start the container
```bash
docker start container_ID
```

> Run one services multiple ports
```bash
docker run -d -p 7080:80 -p 3000:80 nginx:latest
```
> Show list of container
```bash
docker ps -a 
```

> How to delete container
```bash
docker rm container_ID
```

> How to delete all container only one single command?
```bash
docker rm $(docker ps -aq)
```

> How to delete the ruing container?
```bash
docker rm -f container_ID
```

> Add custom/own name the container
```bash
docker run --name mbrsagor -d -p 7080:80 -p 3000:80 nginx:latest
```

> Access the docker container.
```bash
docker exec -it sagor bash
```

> Nginx configurations
```bash
docker run -it --rm -d -p 3000:80 --name sagor -v ~/Desktop/site-content:/usr/share/nginx/html nginx
```
[source](https://www.docker.com/blog/how-to-use-the-official-nginx-docker-image/)
git a