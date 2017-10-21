require 'pry'
require './lib/queue'
require './lib/help'
require 'readline'
require 'csv'


class EventReporter

  include 'Help'

  stty_save = 'stty -g'.chomp

  begin
      while input = Readlines.readline("> ", true)
        case input
        when "exit"
          break
        when "load"
          load
        when "find"
          find("query")
        when "help"
          Help.help
        end
      end
    rescue Interrupt => e
      system('stty', stty_save) #restore
      exit
  end


  def system(command)
    fork {
      exec(command)
    }
  end



  end


end
