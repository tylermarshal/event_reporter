
class Attendee

  attr_reader :first_name, :last_name, :zipcode, :email_address,
              :homephone, :street, :city, :state

  def initialize(attendee)
    @first_name = attendee[:first_name]
    @last_name = attendee[:last_name]
    @zipcode = attendee[:zipcode]
    @email_address = attendee[:email_address]
    @homephone = attendee[:homephone]
    @street = attendee[:street]
    @city = attendee[:city]
    @state = attendee[:state]
  end

end
