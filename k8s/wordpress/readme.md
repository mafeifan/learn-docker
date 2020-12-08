https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

1. 创建 kustomization.yaml
2. curl -LO https://k8s.io/examples/application/wordpress/mysql-deployment.yaml
3. curl -LO https://k8s.io/examples/application/wordpress/wordpress-deployment.yaml
4. kubectl apply -k ./
