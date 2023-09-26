#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

bundle exec bin/rails db:create db:migrate
bundle exec bin/rails s -b 0.0.0.0