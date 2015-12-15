if ENV["COVERAGE"]
  require "coveralls"
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'planaria'
