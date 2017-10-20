require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'
require 'pry'

class EventReporterTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert_instance_of EventReporter, event_reporter
  end


end
