require 'pry'
require './lib/queue'
require './lib/help'
require './lib/load'
require 'readline'
require 'csv'


  stty_save = 'stty -g'.chomp

  begin
      while input = Readline.readline("> ", true)
        case input
        when "exit"
          break
        when "load"
          contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
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


# def system(command)
#   exec(command)
# end
