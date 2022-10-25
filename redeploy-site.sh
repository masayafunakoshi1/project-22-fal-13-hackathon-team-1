#!/bin/bash

#cd into project
cd portfolio-project

#make sure /main is up to date
git fetch && git reset origin/main --hard

#go into virtual env && install dependencies
source python3-virtualenv/bin/activate
pip install -r requirements.txt

#spin containers down to reduce memory issues
docker compose -f docker-compose.prod.yml down

#run and build flask server and database on docker
docker compose -f docker-compose.prod.yml up -d --build

