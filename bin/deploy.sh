#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

heroku login && \
git add . && \
git commit -am "Auto Commit" && \
git push heroku origin master && \
heroku run rake db:migrate

echo "********** OK **********"
