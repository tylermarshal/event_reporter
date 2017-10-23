require 'csv'
require './lib/cleaner'

class Load

  include Cleaner

  attr_reader :full_list, :queue

  def initialize(file = './full_event_attendees.csv' if nil)
    @full_list = CSV.open file, headers: true, header_converters: :symbol
    @clean_list = []
  end

  def load_command(divided_input)
    if divided_input.length == 1
      full_list
    else
      @full_list = CSV.open '#{divided_input[1]}', headers: true, header_converters: :symbol
    end
    full_list.clean_file
  end

end
