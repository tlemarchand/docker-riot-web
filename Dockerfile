FROM nginx

ARG version

COPY riot-${version} /usr/share/nginx/html
