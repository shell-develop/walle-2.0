##  1、构建镜像
    docker build -t walle:2.0 .
##  2、启动容器
    yum install python-pip docker -y
    pip install docker-compose -i https://pypi.douban.com/simple
    docker-compose up -d
##  3、初始化数据
    docker exec -it walle bash
    cd /opt/walle
    flask waller.py db migrations
