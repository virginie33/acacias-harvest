#!/bin/bash

echo "********** Déploiement **********"

heroku login && \
git add . && \
git commit -m "Auto Commit" && \
git push heroku origin master && \
heroku run rake db:migrate

echo "********** OK **********"
