#/bin/bash
# This shell is to swap from web1 to web2

sed -i '' 's/image: activity/image: activity2/' docker-compose.yml

var="$(docker ps | awk -F' ' '$2 ==  "activity2"' | awk '{print $1}')"

docker rm -f $var

docker-compose up

# service nginx reload
