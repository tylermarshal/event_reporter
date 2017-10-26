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
    input = ""
    until input == 'quit'
      divided_input = gets.to_s.strip.split(' ')
      command_router(divided_input)
    end
  end

  def command_router(divided_input)
    case divided_input.first
    when "load" then @clean_list = load_command(divided_input[1])
    when "help" then help_commands(divided_input.join(' '))
    when "queue" then queue_commands(divided_input.join(' '))
    when "find" then find_commands(divided_input[1], divided_input[2..-1].join(' '))
    else invalid_command
    end
  end

  def find_commands(attribute, criteria)
    symbol_attribute = attribute.to_sym
    cleaned_criteria = clean_criteria(symbol_attribute, criteria)
    @current_queue = @clean_list.find_all do |row|
      row[symbol_attribute] == cleaned_criteria
    end
    puts "All listings with a #{attribute} of '#{criteria}' have been added."
  end

  def queue_commands(input)
    if input.length > 11
      longer_than_11(input)
    else
      short_queue_commands(input)
    end
  end

  def longer_than_11(input)
    file_attribute = input.split(' ').pop()
    queue_command = input.split(' ')[0..-2].join(' ')
    long_queue_commands(queue_command, file_attribute)
  end

  def long_queue_commands(queue_command, file_attribute)
    case queue_command
    when "queue save to" then save_to(@current_queue, file_attribute)
    when "queue export html" then export_html(@current_queue, file_attribute)
    when "queue print by" then print_by(@current_queue, file_attribute)
    end
  end

  def short_queue_commands(input)
    case input
    when "queue clear" then @current_queue = []
    when "queue print" then printer(@current_queue)
    when "queue count" then puts @current_queue.length
    end
  end

end
