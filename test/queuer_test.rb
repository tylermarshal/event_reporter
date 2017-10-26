require_relative 'test_helper'
require 'csv'

class QueueTest < Minitest::Test

  include Queuer

  def test_it_prints
    queue = [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com", :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis", :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke", :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA", :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com", :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO", :zipcode=>"80203"}]

    assert_equal [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com",
                  :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis",
                  :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke",
                  :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000",
                  :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA",
                  :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com",
                  :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO",
                  :zipcode=>"80203"}], printer(queue)
  end

  def test_it_prints_by_attribute
    queue = [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com", :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis", :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke", :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA", :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com", :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO", :zipcode=>"80203"}]

    assert_equal [{:first_name=>"Minh", :last_name=>"Chadke", :email_address=>"uhswanso@jumpstartlab.com",
                  :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton",
                  :state=>"MA", :zipcode=>"01063"}, {:first_name=>"Black", :last_name=>"Jack",
                  :email_address=>"asdfsdf@jumpstartlab.com", :homephone=>"1390838923",
                  :street=>"1334 State St", :city=>"Minneapolis", :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Jay",
                  :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com", :homephone=>"9522405682",
                  :street=>"1042 Logan St", :city=>"Denver", :state=>"CO",
                  :zipcode=>"80203"}], print_by(queue, "last_name")
  end

  def test_it_exports_to_html
    queue = [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com", :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis", :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke", :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA", :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com", :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO", :zipcode=>"80203"}]

    assert_equal [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com",
                  :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis",
                  :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke",
                  :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000",
                  :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA",
                  :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com",
                  :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO",
                  :zipcode=>"80203"}], export_html(queue, "test_list.html")
  end

  def test_it_saves_to_csv_file
    queue = [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com", :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis", :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke", :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000", :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA", :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com", :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO", :zipcode=>"80203"}]

    assert_equal [{:first_name=>"Black", :last_name=>"Jack", :email_address=>"asdfsdf@jumpstartlab.com",
                  :homephone=>"1390838923", :street=>"1334 State St", :city=>"Minneapolis",
                  :state=>"MN", :zipcode=>"55044"}, {:first_name=>"Minh", :last_name=>"Chadke",
                  :email_address=>"uhswanso@jumpstartlab.com", :homephone=>"5189290000",
                  :street=>"1 Chapin Way", :city=>"Northampton", :state=>"MA",
                  :zipcode=>"01063"}, {:first_name=>"Jay", :last_name=>"Ray", :email_address=>"jay@jumpstartlab.com",
                  :homephone=>"9522405682", :street=>"1042 Logan St", :city=>"Denver", :state=>"CO",
                  :zipcode=>"80203"}], save_to(queue, "test_list.csv")
  end
end
