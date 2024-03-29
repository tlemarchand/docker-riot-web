#!/bin/bash
git checkout master
curl -s 'https://api.github.com/repos/element-hq/element-web/releases/latest' | jq -j -r '.name' > version
git add -A
git commit -m `cat version`
git push origin master
git tag `cat version` -f
git push origin `cat version` -f
