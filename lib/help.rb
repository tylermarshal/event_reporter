module Help

  HELP = {"load" => "Erase any loaded data and parse the specified file. If no filename is given, default to full_event_attendees.csv. Format: 'load <filename>'",
  "find" => "Populate the queue with all records matching the criteria for the given attribute. Format: 'find <attribute> <criteria>'",
  "queue count" => "Output how many records are in the current queue",
  "queue clear" => "Empty the queue",
  "queue print" => "Print out a tab-delimited data table with a header row following this format: LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE",
  "queue print by" => "Print the data table sorted by the specified attribute like zipcode. Format: 'queue print by <attribute>'",
  "queue save to" => "Export the current queue to the specified filename as a CSV. The file will include data and headers for last name, first name, email, zipcode, city, state, address, and phone number. Format: 'queue save to <filename.csv>'",
  "queue export html" => "Export the current queue to the specified filename as a valid HTML file. Format: 'queue export html <filename.csv>'"}

  def help_commands(command)
    case command
    when "help" then provide_list_of_commands
    when "help load" then puts HELP["load"]
    when "help find" then puts HELP["find"]
    when "help queue count" then puts HELP["queue count"]
    when "help queue clear" then puts HELP["queue clear"]
    when "help queue print" then puts HELP["queue print"]
    when "help queue print by" then puts HELP["queue print by"]
    when "help queue save to" then puts HELP["queue save to"]
    when "help queue export html" then puts HELP["queue export html"]
    end
  end

  def provide_list_of_commands
    puts "\nBelow is a list of commands."
    puts "Enter 'help <command>' for additional information."
    HELP.keys.each {|key| puts "#{key}"}
  end

end
