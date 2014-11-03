#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

heroku login && \
git add . && \
git commit -m "Auto Commit" && \
git push $DIRECTION origin master && \
heroku run rake db:migrate

echo "********** OK **********"
