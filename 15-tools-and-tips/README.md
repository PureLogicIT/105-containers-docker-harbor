# 14 Tools and Tips

## Security scanning
### Trivy
https://www.aquasec.com/products/trivy/

Scan an image for vulnerabilities
```
docker run --rm aquasec/trivy image nginx:1.20.0
```

Scan a Dockerfile for misconfigurations
```
docker run --rm -v $PWD/05-custom-container/:/myapp config /myapp
```

## Manage Docker with UI
### Portainer
https://www.portainer.io/

## Automatic updates
### Watchtower
https://containrrr.dev/watchtower/

## Reverse Proxy
### NGINX Proxy Manager
https://nginxproxymanager.com/

| Username        |Password|
|-----------------|--------|
|admin@example.com|changeme|
