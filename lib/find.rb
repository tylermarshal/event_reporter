def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end


puts "Event_Reporter initialized."

contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  #if zipcode is a certain number grab all contents
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end
