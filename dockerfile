FROM nginx:latest
RUN apt-get update && apt-get install -y nginx-extras

# Nginx Dockerfile
# Includes Nginx Extras :D