#!/bin/bash

DIRECTION="git@heroku.com:acacias.git"
BRANCH="master"

echo "********** Déploiement **********"

bundle exec rspec && \
git pull origin $BRANCH && \
git push origin $BRANCH && \
git push $DIRECTION $BRANCH && \
heroku run rake db:migrate -a acacias

echo "********** OK **********"
