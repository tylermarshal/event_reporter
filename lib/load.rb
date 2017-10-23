require 'csv'
require './lib/cleaner'

class Load

  include Cleaner

  attr_reader :full_list, :queue

  def initialize(file = default_file(file))
    @full_list = CSV.open file, headers: true, header_converters: :symbol
    @clean_list = []
  end

  def default_file(file)
    './full_event_attendees.csv' if file.nil?
  end

  def clean_file
    @clean_list = full_list.clean_file
  end

end
