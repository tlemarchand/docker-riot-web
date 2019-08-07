FROM nginx:1.17

COPY version /tmp/version
COPY gzip.conf /etc/nginx/conf.d/

RUN apt-get update && apt-get install -y curl && \
    curl -SL https://github.com/vector-im/riot-web/releases/download/${</tmp/version}/riot-${</tmp/version}.tar.gz | tar xz --strip-components=1 -C /usr/share/nginx/html/ && \
    apt-get remove --purge -y curl && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*
