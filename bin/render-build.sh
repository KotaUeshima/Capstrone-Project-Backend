#!/usr/bin/env bash
# exit on error
set -o errexit

bin/rails db:migrate

bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean
bundle exec rails db:migrate db:seed