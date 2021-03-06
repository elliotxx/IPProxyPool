## IPProxyPool - 同名项目的克隆版本，添加了自己的修改

## 修改的部分
* 过滤掉 http 协议的IP，只保留 https 和 http/https
* 可通过环境变量 IPPROXYPOOL_API_PORT 修改默认启动端口,修改的代码为：
```
API_PORT = 8000 if os.getenv("IPPROXYPOOL_API_PORT") == "" else int(os.getenv("IPPROXYPOOL_API_PORT"))
```

## use with Docker
拉取镜像
```
docker pull registry.cn-shanghai.aliyuncs.com/elliotxx/ipproxy
```
启动镜像(映射到主机8010端口)
```
docker run -d --name ipproxy -p 8010:80 -v $PWD/data:/root/IPProxyPool/data registry.cn-shanghai.aliyuncs.com/elliotxx/ipproxy
```
本地构建镜像
```
docker build -f Dockerfile -t ipproxy .
```

## 参考
详情可参考原项目:
[qiyeboy/IPProxyPool](https://github.com/qiyeboy/IPProxyPool)
