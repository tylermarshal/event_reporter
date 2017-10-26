require_relative 'test_helper'
require 'csv'

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

  def test_load_and_clean_file
    load_file = CSV.open './full_event_attendees.csv', headers: true, header_converters: :symbol
    clean_file_row_3 = {:regdate => "11/12/08 13:23",
                        :first_name => "Sarah",
                        :last_name => "Hankins",
                        :email_address => "pinalevitsky@jumpstartlab.com",
                        :homephone => "4145205000",
                        :street => "2022 15th Street NW",
                        :city => "Washington",
                        :state => "DC",
                        :zipcode => "20009"}
    assert_equal clean_file_row_3, load_and_clean_file(load_file)[1]
  end

  def test_clean_file
    dirty_file_row_3 = {:regdate => "11/12/08 13:23",
                        :first_name => "SArah",
                        :last_name => "Hankins ",
                        :email_address => "pinalevitsky@jumpstartlab.com",
                        :homephone => "414-520-5000",
                        :street => "2022 15th Street NW",
                        :city => "washington",
                        :state => "dc",
                        :zipcode => "20009  "}
    clean_file_row_3 = {:regdate => "11/12/08 13:23",
                        :first_name => "Sarah",
                        :last_name => "Hankins",
                        :email_address => "pinalevitsky@jumpstartlab.com",
                        :homephone => "4145205000",
                        :street => "2022 15th Street NW",
                        :city => "Washington",
                        :state => "DC",
                        :zipcode => "20009"}

    assert_equal clean_file_row_3, clean_file(dirty_file_row_3)
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

  def test_it_cleans_criteria
    assert_equal "12/8/08 20:47", clean_criteria(:regdate, "12/8/08 20:47 ")
    assert_equal "VA", clean_criteria(:state, " va")
    assert_equal "Minneapolis", clean_criteria(:city, " minneapolis")
    assert_equal "1601 East River Terrace", clean_criteria(:street, "  1601 East River Terrace")
    assert_equal "5102824000", clean_criteria(:homephone, "510 282 4000")
    assert_equal "qrm4462@jumpstartlab.com", clean_criteria(:email_address, "qrm4462@jumpstartlab.com  ")
    assert_equal "Sanchez", clean_criteria(:last_name, "  Sanchez")
    assert_equal "00239", clean_criteria(:zipcode, 239)
    assert_equal "Rachel Ray", clean_criteria(:first_name, "rachel ray   ")
  end



end
