require 'pry'

module Queuer

  def print_by(attribute)

  end

  def printer
    self.each do |row|
      puts "#{row[:last_name]}  #{row[:first_name]}  #{row[:email_address]}  #{row[:zipcode]}  #{row[:city]}  #{row[:state]}  #{row[:street]}  #{row[:homephone]}}"
      binding.pry
    end
  end

  def save_to(filename)

  end

  def export_html(filename)

  end

end
