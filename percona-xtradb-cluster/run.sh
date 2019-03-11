# https://hub.docker.com/_/percona
# Percona Server是MySQL的一个分支，类似于MariaDB，是完全与MySQL兼容的一款独立的数据库产品。特别适合配置数据库之间主主同步

# 拉镜像
docker pull percona/percona-xtradb-cluster:5.7

# 给镜像设置别名
docker tag percona/percona-xtradb-cluster:5.7 pxc

# 创建网络并设置网段和子网掩码
docker network create --subnet=172.19.0.0/24 pxc-network

# 创建三个mysql节点

docker run -d -p 33010:3306 -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=pxc_cluster --name=pxc_node1 --net=pxc-network --ip=172.19.0.2 pxc
docker run -d -p 33011:3306 -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=pxc_cluster -e CLUSTER_JOIN=pxc_node1 --name=pxc_node2 --net=pxc-network --ip=172.19.0.3 pxc
docker run -d -p 33012:3306 -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=pxc_cluster -e CLUSTER_JOIN=pxc_node1 --name=pxc_node3 --net=pxc-network --ip=172.19.0.4 pxc