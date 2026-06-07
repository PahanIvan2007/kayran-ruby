#!/usr/bin/env bash
set -o errexit

bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec puma -C config/puma.rb
