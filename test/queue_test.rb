require 'minitest/autorun'
require 'minitest/pride'
require './lib/queuer'
require 'pry'

class QueueTest < Minitest::Test

  def test_it_exists
    queue = Queue.new

    assert_instance_of Queue, queue
  end


end
