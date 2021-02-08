
curl -L https://nginx.org/download/nginx-1.19.6.tar.gz | tar xz
curl -L https://github.com/chobits/ngx_http_proxy_connect_module/archive/master.tar.gz | tar xz
cd nginx-1.19.6 \
    && patch -p1 < ../ngx_http_proxy_connect_module-master/patch/proxy_connect_rewrite_1018.patch \
    && ./configure --add-module=../ngx_http_proxy_connect_module-master \
    && make