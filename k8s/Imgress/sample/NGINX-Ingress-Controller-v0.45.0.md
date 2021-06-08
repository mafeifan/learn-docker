### 平台
* MacOS 11.2.3
* Docker Desktop 3.3.3
* Docker Engine: 20.10.6
* Kubernates: v1.19.7

### 坑

目前常用的K8S镜像库有

* docker.io (docker hub公共镜像库)
* gcr.io (Google container registry)
* k8s.gcr.io (等同于 gcr.io/google-containers)
* quay.io (Red Hat运营的镜像库)

k8s.gcr.io 被墙，拉image可能会失败，建议去docker hub找别人的。没办法，具体[参见](https://developer.aliyun.com/article/759310)

## 步骤

1. 本地启动docker，检查k8s版本，是1.19.7
`kubectl version`
```
Client Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.7", GitCommit:"1dd5338295409edcfff11505e7bb246f0d325d15", GitTreeState:"clean", BuildDate:"2021-01-13T13:23:52Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.7", GitCommit:"1dd5338295409edcfff11505e7bb246f0d325d15", GitTreeState:"clean", BuildDate:"2021-01-13T13:15:20Z", GoVersion:"go1.15.5", Compiler:"gc", Platform:"linux/amd64"}
```
2. 安装NGINX Ingress Controller,打开[官网](https://kubernetes.github.io/ingress-nginx/deploy/#docker-desktop)

提示安装`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.46.0/deploy/static/provider/cloud/deploy.yaml`

先浏览器打开`https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.46.0/deploy/static/provider/cloud/deploy.yaml`搜`image:`

引用了这个镜像`k8s.gcr.io/ingress-nginx/controller:v0.46.0@sha256:52f0058bed0a17ab0fb35628ba97e8d52b5d32299fbc03cc0f6c7b9ff036b61a`

本地先尝试拉下`docker pull k8s.gcr.io/ingress-nginx/controller:v0.46.0...` 发现失败，很简单，这个镜像地址被墙了，得找替换！

打开 docker hub 搜 ingress-nginx-controller, 只找到了最新的【v0.45.0](https://hub.docker.com/r/willdockerhub/ingress-nginx-controller/tags?page=1&ordering=last_updated)

猜测差距不大，又下载打开`https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/cloud/deploy.yaml`
把`image: k8s.gcr.io/ingress-nginx/controller:v0.45.0` 替换为 `image: willdockerhub/ingress-nginx-controller:v0.45.0`

::: tip
这步非常重要哦
:::

3. 我重命名为了`v0.45.0-deploy.yaml`
`kubectl apply -f v0.45.0-deploy.yaml`

验证
`kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx`

`kubectl describe pod`

4. 跑一个例子

准备文件，下载sample

运行他们
```
 kubectl apply -f sample/apple.yaml 
 kubectl apply -f sample/banana.yaml 
 kubectl apply -f sample/ingress.yaml 
```

注意`ingress.yaml`我配置的域名是`ingress.finley.demo`需要让本地访问

5. 打开 /etc/hosts
添加`127.0.0.1 ingress.finley.demo`

6. 见证奇迹时刻

浏览器打开 `http://ingress.finley.demo/apple` 页面显示 apple
浏览器打开 `http://ingress.finley.demo/banana` 页面显示 banana
其实就是个代理

一图看流程
![](https://gitee.com/Finley/upic/raw/master/picGo/20210603144746.png)

## 参考

https://kubernetes.github.io/ingress-nginx/deploy/#docker-desktop

https://developer.aliyun.com/article/759310
