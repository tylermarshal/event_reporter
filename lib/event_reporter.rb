require 'pry'
require './lib/queue'
require './lib/help'
require './lib/load'
require 'readline'
require 'csv'

class EventReporter

  def event_reporter
    until input == 'quit'
      input = gets.strip
      divided_input = input.split(' ')
      if divided_input == nil
        puts "Please enter a command"
      else
        command_router(divided_input)
      end
    end
  end

end
