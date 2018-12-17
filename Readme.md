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

## 4、修改密码
    [root@wd walle]# python
    Python 2.7.5 (default, Oct 30 2018, 23:45:53) 
    [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> from flask_login import UserMixin
    >>> from sqlalchemy import String, Integer, DateTime, or_
    >>> from walle import model
    >>> from walle.model.database import SurrogatePK, db, Model
    >>> from walle.service.extensions import permission
    >>> from walle.service.rbac.role import *
    >>> from werkzeug.security import check_password_hash, generate_password_hash
    >>> from flask import current_app
    >>> 
    >>> print(generate_password_hash('123456'))        
    pbkdf2:sha256:50000$jyS8Bg63$e5ef51fb5aca966b54cc3037cd2fb51452aae61e87f9ffb970c8dcf89889b327
    >>> 
