## Windows

Kube 版本 1.19.7

https://github.com/AliyunContainerService/k8s-for-docker-desktop

让安装

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml

验证
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx

排错
kubectl describe pod

发现还是网络问题！！

kubectl get ing ingress-http

kubectl describe ing ingress-http

kubectl get svc -n ingress-nginx

http://tomcat.itheima.com:31303
