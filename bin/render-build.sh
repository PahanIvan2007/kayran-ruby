#!/usr/bin/env bash
set -o errexit

bundle install
yarn install
yarn build:css

# Generate temporary secret for asset compilation (runtime uses SECRET_KEY_BASE from env)
export SECRET_KEY_BASE=$(bundle exec rails secret)
bundle exec rails assets:precompile
bundle exec rails db:migrate
