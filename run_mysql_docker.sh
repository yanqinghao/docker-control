containers="$(docker ps | grep  "mysql" | awk '{print $1}')"
if [[ -n $containers ]]; then
    echo "find mysql container id: $containers already running"
else
    echo "run mysql"
    stoped_containers="$(docker ps -a| grep  "mysql" | awk '{print $1}')"
    if [[ -n $stoped_containers ]]; then
        echo "run stoped container $stoped_containers"
        docker restart $stoped_containers
    else
        echo "run a mysql container"
        docker run -itd --name suanpan-mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7
    fi
fi