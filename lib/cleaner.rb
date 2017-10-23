require 'csv'

module Cleaner
  contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol

  def clean_file
    self.each do |row|

    row[:id] = row[:id]
    row[:RegDate] = clean_reg_date(row[:RegDate])
    row[:first_Name] = clean_first_name(row[:first_Name])
    row[:last_Name] = clean_last_name(row[:last_Name])
    row[:Email_Address] = clean_email(row[:Email_Address])
    row[:HomePhone] = clean_home_phone(row[:HomePhone])
    row[:Street] = clean_street(row[:Street])
    row[:City] = clean_city(row[:City])
    row[:State] = clean_state(row[:State])
    row[:Zipcode] = clean_zipcode(row[:Zipcode])
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
