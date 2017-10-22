require 'minitest/autorun'
require 'minitest/pride'
require './lib/help'
require 'pry'

class Helper
  include Help

end

class HelpTest < Minitest::Test


  # def test_it_exists
  #   help = Help.new
  #
  #   assert_instance_of Help, help
  # end

  def test_provides_all_commands
    Helper.help

  end


end
