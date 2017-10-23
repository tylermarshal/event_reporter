require 'pry'
require './lib/queue'
require './lib/help'
require './lib/load'
require 'readline'
require 'csv'

class EventReporter

  def initialize
    @queue = queue
    @clean_list = clean_list
  end

  def repl
    input = ""
    until input == 'quit'
      input = gets.strip
      divided_input = input.split(' ')
      if divided_input == nil
        puts "That is not a valid command"
      else
        command_router(divided_input)
      end
    end
  end

  def command_router(divided_input)
      case divided_input.first
      when "load" then @clean_list = Load.new(divided_input[1])
      when "help" then help_commands(divided_input)
      when "queue" then queue_commands(divided_input[1..-1])
      when "find" then find_commands(divided_input[1], divided_input[2])
      end
  end

  def find_commands(attribute, criteria)
    queue = Queue.new
    @clean_list.select

  end

end
