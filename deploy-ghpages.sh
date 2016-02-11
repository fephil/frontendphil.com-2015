#!/bin/bash

# Define variables depending on the branch
if [[ $TRAVIS_BRANCH == 'master' ]]
  then
    REPO="github.com/fephil/fephil.github.io.git"
    DOMAIN="frontendphil.com"
  else
    REPO="github.com/fephil/dev.frontendphil.com.git"
    DOMAIN="dev.frontendphil.com"
fi

# Get the commit details
THE_COMMIT=`git rev-parse HEAD`

# Set git details
git config --global user.email "enquiry@frontendphil.com"
git config --global user.name "Travis CI"

# Run gulp
gulp deploy --debug --production

# Move to created directory
cd _dist

# Create CNAME file and populate with domain depending on branch
cat > CNAME << EOF
$DOMAIN
EOF

# Push to git by overriding previous commits
# IMPORTANT: Supress messages so nothing appears in logs
if [[ $TRAVIS_BRANCH == 'master' ]]; then
  git init
  git add -A
  git commit -m "Travis CI automatic build for $THE_COMMIT"
  git push --force --quiet "https://${GH_TOKEN}@${REPO}" master > /dev/null 2>&1
elif [[ $TRAVIS_BRANCH == 'develop' ]]; then
  git init
  git add -A
  git commit -m "Travis CI automatic build for $THE_COMMIT"
  git push --force --quiet "https://${GH_TOKEN}@${REPO}" master:gh-pages > /dev/null 2>&1
else
  echo "Not on master or develop branch so do not publish the website to GitHub Pages"
fi
