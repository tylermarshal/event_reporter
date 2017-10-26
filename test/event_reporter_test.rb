require_relative 'test_helper'

class EventReporterTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert_instance_of EventReporter, event_reporter
  end

  def test_it_responds_to_invalid_command
    event_reporter = EventReporter.new

    assert_equal nil, event_reporter.command_router(["kjalksjdflk"])
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

    assert_equal found_row, event_reporter.current_queue
  end

  def test_it_prints_data
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")

    assert_nil nil, event_reporter.queue_commands("queue print")
  end

  def test_it_counts_queue
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")

    assert_equal nil, event_reporter.queue_commands("queue count")
  end

  def test_it_counts_queue_more_than_1_result
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "John")

    assert_equal nil, event_reporter.queue_commands("queue count")
  end

  def test_it_clears_queue
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "John")

    assert_equal [], event_reporter.queue_commands("queue clear")
  end

  def test_longer_than_11
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")

    assert_equal [{:regdate=>"2/1/09 20:28", :first_name=>"Minh",
      :last_name=>"Phadke", :email_address=>"uhswanso@jumpstartlab.com",
      :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton",
      :state=>"MA", :zipcode=>"01063"}],
      event_reporter.longer_than_11("queue print by zipcode")
  end

  def test_long_queue_commands
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "Minh")

    assert_equal [{:regdate=>"2/1/09 20:28", :first_name=>"Minh",
      :last_name=>"Phadke", :email_address=>"uhswanso@jumpstartlab.com",
      :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton",
      :state=>"MA", :zipcode=>"01063"}],
      event_reporter.long_queue_commands("queue print by", "zipcode")
  end

  def test_short_queue_commands
    event_reporter = EventReporter.new
    event_reporter.command_router(["load"])
    event_reporter.find_commands("first_name", "John")

    assert_equal [], event_reporter.short_queue_commands("queue clear")
  end



end
