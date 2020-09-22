containers="$(docker ps | grep "minio" | awk '{print $1}')"
if [[ -n $containers ]]; then
    echo "find minio container id: $containers already running"
else
    echo "run minio"
    stoped_containers="$(docker ps -a | grep "minio" | awk '{print $1}')"
    if [[ -n $stoped_containers ]]; then
        echo "run stoped container $stoped_containers"
        docker restart $stoped_containers
    else
        echo "run a minio container"
        docker run -itd --name suanpan-minio-test -p 9000:9000 \
            -e "MINIO_ACCESS_KEY=minio" -e "MINIO_SECRET_KEY=minio@suanpan" \
            minio/minio server /data
    fi
fi
