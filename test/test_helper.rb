require "simplecov"
SimpleCov.start

require './lib/event_reporter'
require './lib/cleaner'
require './lib/help'
require './lib/queuer'
require './lib/attendee'


require 'minitest/autorun'
require 'minitest/pride'

require 'pry'
