![](https://pek3b.qingstor.com/hexo-blog/hexo-blog/20201105115446.png)

docker-compose up -d --scale web=3
```shell
> curl localhost:8008
Hello Container World! I have been seen 5 times and my hostname is 92340f83986c.
> curl localhost:8008
Hello Container World! I have been seen 6 times and my hostname is e19a05efe8f8.
> curl localhost:8008
Hello Container World! I have been seen 7 times and my hostname is 0803f35a1f18.
> curl localhost:8008
Hello Container World! I have been seen 8 times and my hostname is 92340f83986c.
```