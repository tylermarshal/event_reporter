require_relative 'test_helper'
require 'csv'

class AttendeeTest < Minitest::Test

  def test_it_exists
    attendee = Attendee.new("list")

    assert_instance_of Attendee, attendee
  end

end
