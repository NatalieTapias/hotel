# Add simplecov
require "minitest"
require "minitest/pride"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'simplecov'
SimpleCov.start
# require_relative your lib files here!

require_relative "../lib/date_range"
require_relative "../lib/room"
