require 'pry'
require './lib/queuer'
require './lib/help'
require './lib/cleaner'
require 'csv'

class EventReporter

  include Cleaner
  include Queuer
  include Help

  attr_reader :current_queue
  attr_accessor :clean_list

  def initialize
    @current_queue = []
    @clean_list = clean_list
  end

  def repl
    "Please enter a command. Type 'help' for a list of commands."
    input = ""
    until input == 'quit'
      input = gets.to_s.strip
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
    when "load" then @clean_list = load_command(divided_input[1])
    when "help" then help_commands(divided_input.join(' '))
    when "queue" then queue_commands(divided_input.join(' '))
    when "find" then find_commands(divided_input[1], divided_input[2..-1].join(' '))
    end
  end

  def find_commands(attribute, criteria)
    symbol_attribute = attribute.to_sym
    cleaned_criteria = clean_criteria(symbol_attribute, criteria)
    @current_queue = @clean_list.find_all do |row|
      row[symbol_attribute] == cleaned_criteria
    end
    puts "All listings with a #{attribute} of '#{criteria}' have been added to the queue."
  end

  def queue_commands(input)
    if input.length > 11
      input = input.split(' ')
      queue_command = input[0..-2].join(' ')
      case queue_command
      when "queue save to" then save_to(@current_queue, input[-1])
      when "queue export html" then export_html(@current_queue, input[-1])
      when "queue print by" then print_by(@current_queue, input[-1])
      end
    else
      case input
      when "queue clear" then @current_queue = []
      when "queue print" then printer(@current_queue)
      when "queue count" then puts @current_queue.length
      end
    end
  end

end
