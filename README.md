# docker-riot-web
This Element web container image aims to be very simple (based on Nginx official).

You have to provide a "config.json" file to configure your instance at this path : "/usr/share/nginx/html/config.json".
On Kubernetes it can be mounted from a ConfigMap.

Tagging is done this way :
* latest : always the latest version / build
* vX.X.X : always the latest build for this version
* vX.X.X-n : a specific build, so you can easily go back in time if needed.

You should not use a "vX.X.X-n" image and never change it : even if Riot version doesn't changes, base images (Debian and Nginx in this case) are regularly updated, notably to fix security issues.