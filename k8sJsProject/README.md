# MongoDB and Note

> If you want to run the app please follow the steps:

- kubectl apply -f mongo-config.yaml 
- kubectl apply -f mongo-secret.yaml 
-  kubectl apply -f mongo.yaml
- kubectl apply -f webapp.yaml

### if you want to see `all` please run the command:

```bash
kubectl get all
```

### If you want to see `config map` then run the command:

```bash
kubectl get configmap
```

### If you want to see `secret` map then run the command:
```bash
kubectl get secret
```

### Describe service
```bash
kubectl describe service webapp-service
```

### Get IP address to browser
```bash
minikube ip
kubectl get node -o wide
```
