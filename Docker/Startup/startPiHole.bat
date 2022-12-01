docker run ^
-d ^
--name pihole_win ^
-e ServerIP=192.168.1.2 ^
-e WEBPASSWORD=PASSWORD ^
-e TZ="America/Chicago" ^
-e DNS1=172.17.0.1 ^
-e DNS2=1.1.1.1 ^
-e DNS3=1.0.0.1 ^
-p 80:80 ^
-p 53:53/tcp ^
-p 53:53/udp ^
-p 443:443 ^
--restart=unless-stopped ^
pihole/pihole:latest
