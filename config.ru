# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
puts 'OpenAPI spec on http://127.0.0.1:3000/spec/'

run Rails.application
Rails.application.load_server
