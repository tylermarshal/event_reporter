require_relative 'test_helper'

class HelpTest < Minitest::Test

  include Help

  def test_provides_all_commands
    assert_equal ["load", "find", "queue count",
                  "queue clear", "queue print",
                  "queue print by", "queue save to",
                  "queue export html"], help_commands("help")
  end

  def test_it_provides_load_help
    assert_nil nil, help_commands("help load")
  end

  def test_it_provides_find_help
    assert_nil nil, help_commands("help find")
  end

  def test_it_provides_queue_count_help
    assert_nil nil, help_commands("help queue count")
  end

  def test_it_provides_queue_clear_help
    assert_nil nil, help_commands("help queue clear")
  end

  def test_it_provides_queue_print_help
    assert_nil nil, help_commands("help queue print")
  end

  def test_it_provides_queue_print_by_help
    assert_nil nil, help_commands("help queue print by")
  end

  def test_it_provides_queue_save_to_help
    assert_nil nil, help_commands("help queue save to")
  end

  def test_it_provides_queue_export_html_help
    assert_nil nil, help_commands("help queue export html")
  end



end
