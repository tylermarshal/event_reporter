require './lib/event_reporter'

event_reporter = EventReporter.new
puts "Please enter a command. Type 'help' for a list of commands."
event_reporter.repl
