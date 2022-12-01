docker volume create portainer_data
docker run ^
  -d ^
  --name portainer ^
  -p 8000:8000 ^
  -p 9000:9000 ^
  --restart unless-stopped ^
  -v d:/meta/portainer-ce:portainer_data ^
  -v \\.\pipe\docker_engine:\\.\pipe\docker_engine ^
  portainer/portainer-ce
