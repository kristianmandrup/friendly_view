# This file is used by Rack-based servers to start the application.

require 'rack'
require 'world_flags/rack_locale'

require ::File.expand_path('../config/environment',  __FILE__)

# use Rack::Profiler if ENV['RACK_ENV'] == 'development'

use Rack::Locale

run FriendlyRent::Application

