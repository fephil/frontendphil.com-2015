#!/bin/bash

# If any command errors, fail Travis
set -e

# Get the commit details
THE_COMMIT=`git rev-parse HEAD`

# Set git details
git config --global user.email "enquiry@frontendphil.com"
git config --global user.name "Travis CI"

# Run gulp
gulp deploy --debug --production

# Move to created directory
cd _dist

# Push to git by overriding previous commits
# IMPORTANT: Supress messages so nothing appears in logs
if [[ $TRAVIS_BRANCH == 'master' ]]; then
  git init
  git add -A
  git commit -m "Travis CI automatic build for $THE_COMMIT"
  git push --quiet --force "https://${AZURE_USER}:${AZURE_PASSWORD}@${AZURE_WEBSITE}.scm.azurewebsites.net:443/${AZURE_WEBSITE}.git" master > /dev/null 2>&1
else
  echo "Not on master branch so do not deploy the website to Azure"
fi
