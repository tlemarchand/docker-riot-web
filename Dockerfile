FROM nginx:1.17

ARG version

RUN apt-get update && apt-get install -y curl && \
    curl -SL https://github.com/vector-im/riot-web/releases/download/${version}/riot-${version}.tar.gz | tar xzC /usr/share/nginx/html/ && \
    apt-get remove --purge -y curl && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*
