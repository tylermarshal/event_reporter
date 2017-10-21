module Help

  HELP = {"load" => "Erase any loaded data and parse the specified file (load <filename>). If no filename is given, default to full_event_attendees.csv.",
  "find" => "Populate the queue with all records matching the criteria for the given attribute. (find <attribute> <criteria>)",
  "queue count" => "Output how many records are in the current queue",
  "queue clear" => "Empty the queue",
  "queue print" => "Print out a tab-delimited data table with a header row following this format =>
  LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE",
  "queue print by" => "Print the data table sorted by the specified attribute like zipcode. (queue print by <attribute>)",
  "queue save to" => "Export the current queue to the specified filename as a CSV. The file will include data and headers for last name, first name, email, zipcode, city, state, address, and phone number. (queue save to <filename.csv>)",
  "queue export html" => "Export the current queue to the specified filename as a valid HTML file. (queue export html <filename.csv>)"}

  def help(command)
    if command == ""
      HELP.keys
    elsif command == "load"
      HELP["load"]
    elsif command == "find"
      HELP["find"]
    elsif command == "queue count"
      HELP["queue count"]
    elsif command == "queue clear"
      HELP["queue clear"]
    elsif command == "queue print"
      HELP["queue print"]
    elsif command == "queue print by"
      HELP["queue print by"]
    elsif command == "queue save to"
      HELP["queue save to"]
    elsif command == "queue export html"
      HELP["queue export html"]
    end
  end

end
