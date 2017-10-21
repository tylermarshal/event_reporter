class Load
  def load_file
    CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
  end
end
