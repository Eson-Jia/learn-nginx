# learn-nginx

## ngx_http_proxy_connect_module

### [CONNECT Method](https://tools.ietf.org/html/rfc7231#section-4.3.6)

`CONNCET`方法指示请求接受者与`原目标服务器`建立一个隧道连接,原目标服务器在`request-target`中指明.建立成功之后这个隧道只用来双向不透明地转发包,直到隧道被关闭.隧道一般用来建一个端对端的虚拟连接,通过一个或多个可以使用`TLS`加密的代理.  
CONNECT 方法只会被代理使用,如果一个`原目标服务器`收到`CONNCET`请求,它`可以`回复`2xx`状态码来表示一个连接已经建立.但是,很多原服务器没有实现该方法.

客户端发送的`CONNECT`请求中必须携带请求目的的[authority from](https://tools.ietf.org/html/rfc7230#section-5.3);例如,请求目标包含管道目标端的主机地址和端口(由分号分割).例如:

```http
CONNCET server.example.com:80 HTTP/1.1
Host: server.example.com:80
```

接受到请求的代理直连请求目标建立一个隧道,也可以将`CONNECT`请求转发给下一个代理.2xx 的 response 指示发送端(以及所有入站代理)在接受完 response 头部后的**结束空行**之后要立即切换到隧道模式.在空行之后接受到的数据.任何非成功的 response 则表示隧道还未成功建立,现在的连接仍旧是 HTTP 模式.

当隧道的中介检测到任何一端关闭连接之后,隧道也会被关闭:媒介必须尝试从关闭端向另一端发送数据,关闭双向连接,并丢弃还没发送出去的数据.  
未完待续.
