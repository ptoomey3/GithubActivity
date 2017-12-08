#/bin/bash
# This shell is to swap from web2 to web1

sed -i '' 's/image: activity2/image: activity/' docker-compose.yml

docker-compose up

var="$(docker ps | awk -F' ' '$2 ==  "activity2"' | awk '{print $1}')"

if [ -z "$var" ]
then
     echo "\n"
else
      docker rm -f $var
fi



# service nginx reload
