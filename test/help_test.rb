require_relative 'test_helper'

class HelpTest < Minitest::Test

  include Help

  def test_provides_all_commands
    assert_equal ["load", "find", "queue count",
                  "queue clear", "queue print",
                  "queue print by", "queue save to",
                  "queue export html"], help("help")
  end

  def test_it_provides_load_help
    assert_equal "Erase any loaded data and parse the specified file (Format: load <filename>). If no filename is given, default to full_event_attendees.csv.",
    help("help load")
  end

  def test_it_provides_find_help
    assert_equal "Populate the queue with all records matching the criteria for the given attribute. Format: find <attribute> <criteria>)",
     help("help find")
  end

  def test_it_provides_queue_count_help
    assert_equal "Output how many records are in the current queue",
     help("help queue count")
  end

  def test_it_provides_queue_clear_help
    assert_equal "Empty the queue",
     help("help queue clear")
  end

  def test_it_provides_queue_print_help
    assert_equal "Print out a tab-delimited data table with a header row following this format: LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE",
    help("help queue print")
  end

  def test_it_provides_queue_print_by_help
    assert_equal "Print the data table sorted by the specified attribute like zipcode. Format: queue print by <attribute>",
     help("help queue print by")
  end

  def test_it_provides_queue_save_to_help
    assert_equal "Export the current queue to the specified filename as a CSV. The file will include data and headers for last name, first name, email, zipcode, city, state, address, and phone number. (queue save to <filename.csv>)",
     help("help queue save to")
  end

  def test_it_provides_queue_export_html_help
    assert_equal "Export the current queue to the specified filename as a valid HTML file. Format: queue export html <filename.csv>",
     help("help queue export html")
  end



end
