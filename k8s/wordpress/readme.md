https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

1. 创建 kustomization.yaml
2. curl -LO https://k8s.io/examples/application/wordpress/mysql-deployment.yaml
3. curl -LO https://k8s.io/examples/application/wordpress/wordpress-deployment.yaml
4. kubectl apply -k .

http://35.229.162.73/
mafeifan
5kqZ9V2gtKIlGAT(Jy

## 关于 kustomize

https://blog.csdn.net/easylife206/article/details/109505883

https://www.jianshu.com/p/837d7ae77818

## 解决的痛点
一般应用都会存在多套部署环境：开发环境、测试环境、生产环境，多套环境意味着存在多套 K8S 应用资源 YAML。而这么多套 YAML 之间只存在微小配置差异，比如镜像版本不同、Label 不同等，而这些不同环境下的YAML 经常会因为人为疏忽导致配置错误。再者，多套环境的 YAML 维护通常是通过把一个环境下的 YAML 拷贝出来然后对差异的地方进行修改。一些类似 Helm 等应用管理工具需要额外学习DSL 语法。总结以上，在 k8s 环境下存在多套环境的应用，经常遇到以下几个问题：

如何管理不同环境或不同团队的应用的 Kubernetes YAML 资源
如何以某种方式管理不同环境的微小差异，使得资源配置可以复用，减少 copy and change 的工作量
如何简化维护应用的流程，不需要额外学习模板语法
Kustomize 通过以下几种方式解决了上述问题：

kustomize 通过 Base & Overlays 方式(下文会说明)方式维护不同环境的应用配置
kustomize 使用 patch 方式复用 Base 配置，并在 Overlay 描述与 Base 应用配置的差异部分来实现资源复用
kustomize 管理的都是 Kubernetes 原生 YAML 文件，不需要学习额外的 DSL 语法
————————————————
版权声明：本文为CSDN博主「guoweikuang」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/guoweikuang/article/details/103484666
