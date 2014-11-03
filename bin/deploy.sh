#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

heroku login && \
cd $DIRECTION
git add . && \
git commit -m "Auto Commit" && \
git push heroku origin master && \
heroku run rake db:migrate

echo "********** OK **********"
