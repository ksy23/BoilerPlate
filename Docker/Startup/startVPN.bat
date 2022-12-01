docker run ^
  -d ^
  --name=openvpn-as ^
  -e PUID=1000 ^
  -e PGID=1000 ^
  -e TZ="America/Chicago" ^
  -p 943:943 ^
  -p 9443:9443 ^
  -p 1194:1194/udp ^
  -h 192.168.0.2 ^
  -v d:/meta/vpn:/config ^
  --restart unless-stopped ^
  linuxserver/openvpn-as:2.7.5-ls22
