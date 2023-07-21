#!/usr/bin/env bash
# exit on error
set -o errexit

# Build commands for front end
rm -rf public
npm install --prefix client && npm run build --prefix client
cp -a client/build/. public/

# Build commands for back end
bundle install
bundle exec rake db:migrate 
bundle exec rake db:seed

# Finally, we need to run the following command in the terminal to make sure the script is executable:
# chmod a+x bin/recipes-build.sh