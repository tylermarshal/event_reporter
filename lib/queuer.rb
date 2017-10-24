require 'pry'
require 'erb'

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
    erb_template = ERB.new template_letter

    contents.each do |row|
      form_letter = erb_template.result(binding)
    end
  end

end
