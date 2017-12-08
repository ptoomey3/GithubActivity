#/bin/bash
# This shell is to swap from web2 to web1

name=$1

var=$(grep -m 1 "image: " docker-compose.yml)
var2=$(echo $var | awk '{print $2}')


sed -i '' "s/$var/    image: $name/" docker-compose.yml

docker-compose up

var1="$(docker ps | awk -F' ' '$2 ==  "$var2"' | awk '{print $1}')"

echo $var1

if [ -z "$var1" ]
then
  echo "\n"
else
  docker rm -f $var1
fi



# service nginx reload