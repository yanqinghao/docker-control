containers="$(docker ps | grep  "redis" | awk '{print $1}')"
if [[ -n $containers ]]; then
    echo "find redis container id: $containers already running"
else
    echo "run redis"
    stoped_containers="$(docker ps -a| grep  "redis" | awk '{print $1}')"
    if [[ -n $stoped_containers ]]; then
        echo "run stoped container $stoped_containers"
        docker restart $stoped_containers
    else
        echo "run a redis container"
        docker run -itd --name suanpan-redis-test -p 6379:6379 redis
    fi
fi