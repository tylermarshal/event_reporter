require 'pry'
require 'erb'

module Queuer

  def print_by(queue,attribute)
    sorted_queue = queue.sort_by do |key|
      key[attribute.to_sym]
    end
    printer(sorted_queue)
  end

  def printer(queue)
    queue.each do |row|
      puts "#{row[:last_name]}  #{row[:first_name]}  #{row[:email_address]}  #{row[:zipcode]}  #{row[:city]}  #{row[:state]}  #{row[:street]}  #{row[:homephone]}"
    end
  end

  def save_to(queue,filename)
    CSV.open(filename, "wb") do |csv|
      csv << ["last_name", "first_name", "email_address", "zipcode", "city", "state", "street", "homephone"]
      queue.each do |row|
        csv << [row[:last_name], row[:first_name], row[:email_address], row[:zipcode], row[:city], row[:state], row[:street], row[:homephone]]
      end
    end
  end

  def export_html(queue, filename)
    template_letter = File.read "./file_template.html.erb"
    erb_template = ERB.new template_letter
    queue.each do |row|
      form_letter = erb_template.result(binding)
      save_html_file(filename, form_letter)
    end
  end

  def save_html_file(filename, form_letter)
    File.open(filename,'w') do |file|
      file.puts form_letter
    end
  end

end
