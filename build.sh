#!/bin/bash

riot_latest=`curl -s 'https://api.github.com/repos/vector-im/riot-web/releases/latest' | jq -r '.name'`

docker build -t tlemarchand/riot-web:$riot_latest --build-arg version=$riot_latest .

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USER}" --password-stdin
docker push tlemarchand/riot-web:$riot_latest

docker tag tlemarchand/riot-web:$riot_latest tlemarchand/riot-web:latest
docker push tlemarchand/riot-web:latest

exit 0
