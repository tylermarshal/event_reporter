require 'pry'

module Queuer

  def print_by(queue,attribute)

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
