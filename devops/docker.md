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

> Remove docker image
```bash
docker rmi image_name
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

> Copy another container and run new container
```bash
docker run --name mbrsagor --volumes-from container_name_hobe -d -p 3001:80  nginx
```

> Run container from old container
```bash
docker run --name new_container_name -p 3001:80 -d old_container_name:latest 
```

> Docker volume delete or remove
```bash
docker volume rm $(docker volume ls -q)
```

> Show and create network
```bash
docker network ls
docker network create mongo-network
```

> Run mongodb with created network.
```bash
docker run -d --name mongoDB -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --net mongo-network mongo 
```

> Run mongo db server using config.
```bash
docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
--net mongo-network \
--name mymongodb \
-e ME_CONFIG_MONGODB_SERVER=mongoDB \
mongo-express 
```
