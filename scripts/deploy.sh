#!/bin/bash

if [[ $TRAVIS_BRANCH == 'draft' ]] ; then
  cd _site
  git init

  git config user.name "HomescreenBot"
  git config user.email "bot@homescreen.rocks"

  git add .
  git commit -m "Deploy website"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from draft branch.'
  exit 1
fi

