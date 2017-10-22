class Load
  def initialize
    @queue = Queue.new
    @full_list =  CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
  end

  
end
