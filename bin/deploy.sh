#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

bundle exec rake && \
git pull origin master && \
git push origin master && \
git push $DIRECTION master && \
heroku run rake db:migrate -a acacias

echo "********** OK **********"
