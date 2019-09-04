require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

require 'date'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# gems your project needs


# all of our data classes that live in the module
require_relative '../lib/reservation_date'
require_relative '../lib/reservation'
require_relative '../lib/room'
require_relative '../lib/system'
# ...require all needed classes