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

  def command_router
    if divided_input.length == 1
      case divided_input.first
      when "load"
        load_main_file
      when "help"
        help_listing
      end
    else
      case divided_input.first
      when "load"
        load_command(divided_input[1..-1])
      when "help"
        help_commands(divided_input[1..-1])
      when "queue"
        queue_commands(divided_input[1..-1])
      when "find"
        find_commands(divided_input[1..-1])
      end
    end
  end



end
