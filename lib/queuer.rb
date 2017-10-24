require 'pry'

module Queuer

  def print_by(queue,attribute)
    sorted_queue = queue.sort_by do |key|
      key[attribute.to_sym]
    end
    sorted_queue.each do |row|
      puts "#{row[:last_name]}  #{row[:first_name]}  #{row[:email_address]}  #{row[:zipcode]}  #{row[:city]}  #{row[:state]}  #{row[:street]}  #{row[:homephone]}"
    end
  end

  def printer(queue)
    queue.each do |row|
      puts "#{row[:last_name]}  #{row[:first_name]}  #{row[:email_address]}  #{row[:zipcode]}  #{row[:city]}  #{row[:state]}  #{row[:street]}  #{row[:homephone]}"
    end
  end

  def save_to(queue,filename)

  end

  def export_html(queue, filename)

  end

end

queue = [{:regdate=>"2/1/09 20:28",
              :first_name=>"Minh",
              :last_name=>"Phadke",
              :email_address=>"uhswanso@jumpstartlab.com",
              :homephone=>"5189290000",
              :street=>"1 Chapin Way",
              :city=>"Northampton",
              :state=>"MA",
              :zipcode=>"01063"},{:regdate=>"2/1/09 20:28",
                            :first_name=>"Minh",
                            :last_name=>"Phadke",
                            :email_address=>"uhswanso@jumpstartlab.com",
                            :homephone=>"5189290000",
                            :street=>"1 Chapin Way",
                            :city=>"Northampton",
                            :state=>"MA",
                            :zipcode=>"01064"}, {:regdate=>"2/1/09 20:28",
                                          :first_name=>"Minh",
                                          :last_name=>"Phadke",
                                          :email_address=>"uhswanso@jumpstartlab.com",
                                          :homephone=>"5189290000",
                                          :street=>"1 Chapin Way",
                                          :city=>"Northampton",
                                          :state=>"MA",
                                          :zipcode=>"01065"}]
