FROM nginx:1.25-bookworm

COPY version /tmp/version
COPY gzip.conf /etc/nginx/conf.d/

RUN apt-get update && apt-get install -y curl && \
    curl -SL https://github.com/element-hq/element-web/releases/download/`cat /tmp/version`/element-`cat /tmp/version`.tar.gz | tar xz --strip-components=1 -C /usr/share/nginx/html/ && \
    sed -i '/^user/d' /etc/nginx/nginx.conf && \
    sed -i 's/listen       80;/listen       8080;/g'  /etc/nginx/conf.d/default.conf && \
    apt-get remove --purge -y curl && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080
