##  NodePort 练习，暴露Node端口给外部

kubectl create -f deployment.yaml

// 修改三台nginx的index.html
kubectl exec -it pc-deployment-66cb59b984-8p84h -- /bin/sh

kubectl create -f service-nodeport.yaml

# 多出一条记录
kubectl get svc -o wide

## 浏览器访问
http://localhost:30002/

# 只有cluster内部可以访问
`nginx-pod   ClusterIP  10.103.190.130 <none>  80/TCP  5s`

# NodePort, 可以实现外部访问
kubectl expose pods nginx-pod --type=NodePort

# 或者通过yaml创建service
kubectl create -f service/service_nginx.yml




