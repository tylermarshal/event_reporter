require 'minitest/autorun'
require 'minitest/pride'
require_relative 'test_helper'
require 'pry'

class EventReporterTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert_instance_of EventReporter, event_reporter
  end

  def test_it_responds_to_nil
    skip
    event_reporter = EventReporter.new

    assert_equal nil, event_reporter.repl
  end

  def test_it_sends_input_load
    event_reporter = EventReporter.new

    refute_equal nil, event_reporter.command_router(["load"])
  end

  def test_it_finds_data
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")
    found_row = [{:regdate=>"2/1/09 20:28",
                  :first_name=>"Minh",
                  :last_name=>"Phadke",
                  :email_address=>"uhswanso@jumpstartlab.com",
                  :homephone=>"5189290000",
                  :street=>"1 Chapin Way",
                  :city=>"Northampton",
                  :state=>"MA",
                  :zipcode=>"01063"}]

    assert_equal found_row, event_reporter.queue
  end

  def test_it_prints_data
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")
    # queue_print = "Phadke Minh  uhswanso@jumpstartlab.com  5189290000  1 Chapin Way  Northampton  MA   01063"

    assert_nil nil, event_reporter.queue_commands(["print"])
  end

  def test_it_counts_queue
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")
    # queue_print = "Phadke Minh  uhswanso@jumpstartlab.com  5189290000  1 Chapin Way  Northampton  MA   01063"

    assert_equal 1, event_reporter.queue_commands(["count"])
  end

  def test_it_counts_queue_more_than_1_result
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "John")
    # queue_print = "Phadke Minh  uhswanso@jumpstartlab.com  5189290000  1 Chapin Way  Northampton  MA   01063"

    assert_equal 63, event_reporter.queue_commands(["count"])
  end

  def test_it_clears_queue
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "John")


    assert_equal [], event_reporter.queue_commands(["clear"])
  end



end
