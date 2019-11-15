FROM python:2.7-alpine

# 维护者
MAINTAINER ElliotXX <951376975@qq.com>

# 拷贝项目目录
ADD . /root/IPProxyPool

# 设置工作目录
WORKDIR /root/IPProxyPool

# 安装依赖
# 安装 uwsgi
# 设置alpine的镜像地址为阿里云的地址
RUN echo "https://mirrors.aliyun.com/alpine/v3.10/main/" > /etc/apk/repositories \
    && apk update \
    && apk add --no-cache bash gcc make libc-dev linux-headers pcre-dev \
    && apk add --no-cache libxslt-dev \
    && rm -rf /tmp/* /var/cache/apk/*

# 安装 python 依赖
RUN pip install \
    --no-cache-dir \
    -i https://pypi.doubanio.com/simple --trusted-host=pypi.douban.com/simple \
    -r requirements.txt

# 设置 API_SERVER 端口
ENV IPPROXYPOOL_API_PORT=80

# 暴露的端口
EXPOSE 80

# 启动
ENTRYPOINT ["python", "-u", "IPProxy.py"]
