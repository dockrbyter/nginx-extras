![GitHub repo size](https://img.shields.io/github/repo-size/dockrbyter/nginx-extras?logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/dockrbyter/nginx-extras?logo=github)
![GitHub](https://img.shields.io/github/license/dockrbyter/nginx-extras)

# nginx-extras
A Ningx Docker container with Nginx extras included. I've needed a WebDAV container... :D

## Content
Based on the origanl Nginx image, just added 'apt-get install -y nginx-extras'. 

---------------------------------------------------------------------------------------------

## How To
Just handle it like the official Nginx container documentated [here](https://hub.docker.com/_/nginx).
```
'docker run --name some-nginx -d -p 8080:80 some-content-nginx'
```

#### To run your custom config mount it like: 
```
path/to/config/nginx.conf:/etc/nginx/conf.d/nginx-custom.conf:ro
```

#### Check current config:
```
docker exec -it CONTAINERNAME nginx -T
```

#### Docker-Compose
You may want to have a Docker-Compose file, so here is one 🎉
Edit the values and you are good to go...

#### WebDAV
If you need a config file for WebDAV you'll find one in the webdav folder 🤠 Don't forget to create a new htpasswd, may with an online generator like [this](https://hostingcanada.org/htpasswd-generator/) (I'm not related to them, just used their generator...).

#### Nginx Proxy Manager WebDAV Settings
If you are using [Nginx Proxy Manager](https://nginxproxymanager.com/) you may want to add the following content to the advanced tag of your proxy host:

```
location / {
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_pass http://nginxwebdav:80$request_uri;
  proxy_set_header X-Forwarded-Host  $host;
  proxy_set_header X-Forwarded-Port  $server_port;
  proxy_set_header X-Forwarded-Host  $host;
  proxy_set_header X-Forwarded-Port  $server_port;
  proxy_connect_timeout 300;
  proxy_send_timeout 300;
  proxy_read_timeout 300;
  send_timeout 300;
  set $dest $http_destination;
  if ($http_destination ~ "^https://(?<myvar>(.+))") {
    set $dest http://$myvar;
  }
  proxy_set_header Destination $dest;
}
```
---------------------------------------------------------------------------------------------
Check also my [Docker⚓Hub profile](https://hub.docker.com/u/dockrbyter) 👋
