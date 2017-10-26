require 'csv'

module Cleaner

    attr_reader :full_list, :queue

  def load_command(filename = nil)
    filename = './full_event_attendees.csv' if filename.nil?
    load_file = CSV.open filename, headers: true, header_converters: :symbol
    puts "#{filename} has been loaded."
    load_and_clean_file(load_file)
  end

  def load_and_clean_file(load_file)
    clean_file = load_file.map do |row|
      clean_file(row)
    end
    clean_file
  end

  def clean_file(row)
    {:regdate => clean_reg_date(row[:regdate]),
    :first_name => clean_first_name(row[:first_name]),
    :last_name => clean_last_name(row[:last_name]),
    :email_address => clean_email(row[:email_address]),
    :homephone => clean_home_phone(row[:homephone]),
    :street => clean_street(row[:street]),
    :city => clean_city(row[:city]),
    :state => clean_state(row[:state]),
    :zipcode => clean_zipcode(row[:zipcode])}
  end

  def clean_criteria(attribute, criteria)
    case attribute
    when :regdate then clean_reg_date(criteria)
    when :first_name then clean_first_name(criteria)
    when :last_name then clean_last_name(criteria)
    when :email_address then clean_email(criteria)
    when :homephone then clean_home_phone(criteria)
    when :street then clean_street(criteria)
    when :city then clean_city(criteria)
    when :state then clean_state(criteria)
    when :zipcode then clean_zipcode(criteria)
    end
  end

  def clean_first_name(first_name)
      names = first_name.to_s.strip.downcase.split(' ')
      names.map! do |name|
        name.capitalize
      end.join(' ')
  end

  def clean_last_name(last_name)
    names = last_name.to_s.strip.downcase.split(' ')
    names.map! do |name|
      name.capitalize
    end.join(' ')
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_email(email)
    email.to_s.strip
  end

  def clean_home_phone(home_phone)
    home_phone.to_s.delete("-(). ")
  end

  def clean_street(street)
    street.to_s.strip
  end

  def clean_city(city)
    city_names = city.to_s.strip.downcase.split(' ')
    city_names.map! do |name|
      name.capitalize
    end.join(' ')
  end

  def clean_state(state)
    state.to_s.strip.upcase
  end

  def clean_reg_date(reg_date)
    reg_date.to_s.strip
  end

end
