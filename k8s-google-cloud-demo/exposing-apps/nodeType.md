## nodeType 暴露服务练习

kubectl apply -f my-deployment-50000.yaml

kubectl get pods

kubectl apply -f my-np-service.yaml

## 记下nodePort,也就是服务暴露出来的端口，范围是30000-32767，这里是 31544 nodePort
kubectl get service my-np-service --output yaml

## 记下任意一个 EXTERNAL-IP，35.236.136.94 | 35.194.201.238 |  35.234.56.229
kubectl get nodes --output wide

访问 EXTERNAL-IP:nodePort,三个节点的IP都可以访问成功
