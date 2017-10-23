require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'
require 'pry'

class EventReporterTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert_instance_of EventReporter, event_reporter
  end

  # def test_it_responds_to_nil
  #   skip
  #   event_reporter = EventReporter.new
  #
  #   assert_equal nil, event_reporter.repl
  # end

  def test_it_sends_input_load
    event_reporter = EventReporter.new

    refute_equal nil, event_reporter.command_router(["load"])
  end

  def test_it_finds_data
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("zipcode", "20011")

    assert_equal 1, event_reporter.queue
  end



end
