
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'test_helper'
require 'csv'
require 'pry'

class CleanerTest < Minitest::Test

  include Cleaner

  def test_clean_whole_row
    full_list = load_command('./full_event_attendees.csv')
    clean_file_row_3 = {:regdate => "11/12/08 13:23",
                        :first_name => "Sarah",
                        :last_name => "Hankins",
                        :email_address => "pinalevitsky@jumpstartlab.com",
                        :homephone => "4145205000",
                        :street => "2022 15th Street NW",
                        :city => "Washington",
                        :state => "DC",
                        :zipcode => "20009"}
    assert_equal clean_file_row_3, full_list[1]
  end

  def test_it_cleans_first_name
    assert_equal "Suzie Joe", clean_first_name("Suzie joe")
    assert_equal "Joe", clean_first_name("joe")
    assert_equal "Billy", clean_first_name("  Billy")
    assert_equal "Rachel Ray", clean_first_name("rachel ray   ")
  end

  def test_it_cleans_zipcode
    assert_equal "00000", clean_zipcode(nil)
    assert_equal "00239", clean_zipcode(239)
    assert_equal "87239", clean_zipcode(87239)
  end

  def test_it_cleans_last_name
    assert_equal "Miller", clean_first_name("miller")
    assert_equal "Sanchez", clean_first_name("  Sanchez")
    assert_equal "Time-warner", clean_first_name("time-warner  ")
  end

  def test_it_cleans_email
    assert_equal "qrm4462@jumpstartlab.com", clean_email("qrm4462@jumpstartlab.com  ")
  end

  def test_it_cleans_home_phone
    assert_equal "6154385000", clean_home_phone(6154385000)
    assert_equal "9419792000", clean_home_phone("(941)979-2000")
    assert_equal "4252745000", clean_home_phone("425-274-5000")
    assert_equal "3154506000", clean_home_phone("315.450.6000")
    assert_equal "5102824000", clean_home_phone("510 282 4000")
  end

  def test_it_cleans_street
    assert_equal "1601 East River Terrace", clean_street("  1601 East River Terrace")
  end

  def test_it_cleans_city
    assert_equal "New Orleans", clean_city("new orleans ")
    assert_equal "Minneapolis", clean_city(" minneapolis")
  end

  def test_it_cleans_state
    assert_equal "VA", clean_state(" va")
  end

  def test_it_cleans_reg_date
    assert_equal "12/8/08 20:47", clean_reg_date("12/8/08 20:47 ")
  end


end
