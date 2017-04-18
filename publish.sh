#!/bin/sh

set -e;

rm -rf node_modules/sync-browser-mocks
npm install sync-browser-mocks

gulp build;

git add dist;
git commit -m "Dist" || echo "Nothing to distribute";

npm version ${1-patch};

git push;
git push --tags;
npm publish;
