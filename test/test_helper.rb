require "simplecov"
SimpleCov.start

require './lib/event_reporter'
require './lib/cleaner'
require './lib/help'
require './lib/queuer'


require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
