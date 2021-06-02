kubectl create -f service/pod_nginx.yml

# 默认是ClusterType, 定义type=NodePort可以实现外部访问
kubectl expose pods nginx-pod --type=NodePort

# 或者通过yaml创建service
kubectl create -f service/service_nginx.yml

# 多出一条记录
kubectl get svc

# 只有cluster内部可以访问
`nginx-pod          ClusterIP   10.103.190.130   <none>        80/TCP         5s`
