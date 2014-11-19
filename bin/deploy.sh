#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"

echo "********** Déploiement **********"

bundle exec rspec && \
git pull origin master && \
git push origin master && \
git push $DIRECTION master && \
heroku run rake db:migrate -a acacias

echo "********** OK **********"
