require 'pry'
require './lib/queue'
require './lib/help'
require './lib/cleaner'
require 'readline'
require 'csv'

class EventReporter

  include Cleaner

  attr_reader :queue
  attr_accessor :clean_list

  def initialize
    @queue = queue
    @clean_list = clean_list
  end

  # def repl
  #   input = ""
  #   until input == 'quit'
  #     input = gets.to_s.strip
  #     divided_input = input.split(' ')
  #     if divided_input == nil
  #       puts "That is not a valid command"
  #     else
  #       command_router(divided_input)
  #     end
  #   end
  # end

  def command_router(divided_input)
    case divided_input.first
    when "load" then @clean_list = load_command(divided_input[1])
    when "help" then help_commands(divided_input)
    when "queue" then queue_commands(divided_input[1..-1])
    when "find" then @queue = find_commands(divided_input[1], divided_input[2])
    end
  end

  def find_commands(attribute, criteria)
    symbol_attribute = attribute.to_sym
    cleaned_criteria = clean_criteria(symbol_attribute, criteria)
    @queue = @clean_list.find_all do |row|
      row[symbol_attribute] == cleaned_criteria
    end
  end

end
