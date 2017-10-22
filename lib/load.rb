require 'csv'

class Load

  attr_reader :full_list, :queue

  def initialize
    @full_list = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
  end

  def load_command(divided_input)
    if divided_input.length == 1
      full_list
    else
      @full_list = CSV.open '#{divided_input[1]}', headers: true, header_converters: :symbol
    end
  end

end
