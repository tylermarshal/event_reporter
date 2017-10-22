require 'pry'
require './lib/queue'
require './lib/help'
require './lib/load'
require 'readline'
require 'csv'


  def event_reporter

    until input == 'quit'
      input = gets.strip
      divided_input = input.split(' ')
      if divided_input == nil
        puts "Please enter a command"
      elsif divided_input.length == 1
        single_command(divided_input.first)
      else


    end
  end
