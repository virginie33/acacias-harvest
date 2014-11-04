#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

git pull && \
git push origin master && \
git push $DIRECTION master && \
heroku run rake db:migrate -a acacias

echo "********** OK **********"
