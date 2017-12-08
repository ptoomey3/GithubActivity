#/bin/bash
# This shell is to swap from web1 to web2

sed -i '' 's/image: activity/image: activity2/' docker-compose.yml
sed -i '' 's/image: activity22/image: activity2/' docker-compose.yml

docker-compose up

var="$(docker ps | awk -F' ' '$2 ==  "activity"' | awk '{print $1}')"

if [ -z "$var" ]
then
     echo "activity is not running"
else
      docker rm -f $var
fi


# service nginx reload
