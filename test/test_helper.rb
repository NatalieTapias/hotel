# Add simplecov
require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

require "minitest"
require "minitest/pride"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


# require_relative your lib files here!
require_relative "../lib/date_range"
require_relative "../lib/room"
require_relative "../lib/reservation"
