require 'minitest/autorun'
require 'minitest/pride'
require_relative 'test_helper'
require 'pry'

class HelpTest < Minitest::Test

  include Help

  def test_provides_all_commands
    assert_equal ["load", "find", "queue count",
                  "queue clear", "queue print",
                  "queue print by", "queue save to",
                  "queue export html"], help(nil)
  end

  def test_it_provides_load_help
    assert_equal "Erase any loaded data and parse the specified file (Format: load <filename>). If no filename is given, default to full_event_attendees.csv.",
    help("load")
  end

  def test_it_provides_find_help
    assert_equal "Populate the queue with all records matching the criteria for the given attribute. Format: find <attribute> <criteria>)",
     help("find")
  end

  def test_it_provides_queue_count_help
    assert_equal "Populate the queue with all records matching the criteria for the given attribute. Format: find <attribute> <criteria>)",
     help("find")
  end



end
