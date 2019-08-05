#!/bin/bash

riot_latest=`curl -s 'https://api.github.com/repos/vector-im/riot-web/releases/latest' | jq -r '.name'`
builded=`curl --write-out %{http_code} --silent --output /dev/null https://registry.hub.docker.com/v2/repositories/tlemarchand/riot-web/tags/$riot_latest/`

if [[ $builded == '200' ]]; then
  exit 0
fi

dl_url=`curl -s 'https://api.github.com/repos/vector-im/riot-web/releases/latest' | jq -r '.assets[0].browser_download_url'`

wget $dl_url -O $riot_latest.tar.gz
tar xvzf $riot_latest.tar.gz
docker build -t tlemarchand/riot-web:$riot_latest --build-arg version=$riot_latest .

docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
docker push tlemarchand/riot-web:$riot_latest

docker tag tlemarchand/riot-web:$riot_latest tlemarchand/riot-web:latest
docker push tlemarchand/riot-web:latest

exit 0
