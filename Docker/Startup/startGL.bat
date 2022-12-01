docker run ^
  --name=glftpd ^
  -d ^
  --restart unless-stopped ^
  -p 1337:1337/tcp ^
  -p 10000-10100:10000-10100/tcp ^
  -h 192.168.1.2 ^
  -v d:/meta/gl:/glftpd/ftp-data ^
  -v d:/media:/glftpd/site ^
  -e GL_PORT=1337 ^
  -e TZ="America/Chicago" ^
  jonarin/glftpd
