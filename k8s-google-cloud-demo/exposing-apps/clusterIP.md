## clusterIP 暴露服务练习

kubectl apply -f my-deployment.yaml

kubectl apply -f my-cip-service.yaml

kubectl get service my-cip-service --output yaml

记下

clusterIP: 10.76.11.129

获取其中一个正在运行的容器的 shell：

kubectl exec -it my-deployment-5d7b664866-krrwc -- sh

在 shell 中，安装 curl：

apk add --no-cache curl

curl 10.76.11.129:80

可以看到结果，而且Hostname会变
```
Hello, world!
Version: 2.0.0
Hostname: my-deployment-5d7b664866-krrwc
```

exit
