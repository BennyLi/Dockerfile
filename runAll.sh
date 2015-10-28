docker run --name nginx-conf bennyli/nginx-conf echo "Nginx data container for configuration files"

docker run -d --name ghost bennyli/rpi-ghost
docker run -d -p 80:80 -p 443:443 --name nginx --link rpi-ghost:ghost --volumes-from rpi-ghost --volumes-from nginx-conf bennyli/rpi-nginx
