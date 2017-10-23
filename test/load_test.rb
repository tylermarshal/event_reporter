require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'
require 'pry'


class LoadTest < Minitest::Test

  def test_it_exists
    load_csv = Load.new

    assert_instance_of Load, load_csv
  end

  def test_it_responds_to_nil
    load_csv = Load.new

    assert_equal nil, load_csv.load_command(["load"])
  end


end
