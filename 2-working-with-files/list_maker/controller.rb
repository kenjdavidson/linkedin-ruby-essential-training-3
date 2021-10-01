
require_relative 'list_file'

module ListMaker
  class Controller

    @@valid_actions = ["view", "add", "edit", "remove", "quit"]

    def initialize
      @list_file = ListMaker::ListFile.new
    end

    def launch!
      introduction

      loop do 
        action, args = get_action
        break if action == 'quit' || action == 'q'
        result = do_action(action, args)
      end 

      conclusion
    end 

    private 

    def introduction
      puts "-" * 60
      puts "List Maker".upcase.center(60)
      puts "-" * 60
      puts "This is an interactive program to help create and manage lists."
    end 

    def conclusion
      puts 
      puts "-" * 60
      puts "Goodbye!".upcase.center(60)
      puts "-" * 60
      puts
    end 

    def get_action
      action = nil
      until @@valid_actions.map{ |a| a.to_s }.include?(action)
        puts "\nAction: #{@@valid_actions.join(', ')}"
        print "> "
        response = gets.chomp
        # Downcase and split the entered values
        args = response.downcase.strip.split(' ')

        # Take the action from the from
        action = args.shift
      end 
      [action, args]
    end 

    def do_action(action, args)
      case action
      when "view"
        @list_file.view
      when "add"
        @list_file.add args
      when "edit"
        @list_file.edit args
      when "remove"
        @list_file.remove args
      else 
        puts "Sorry, #{action} is not an option."
      end 

      rescue ArgumentError => e
        puts "Oops! #{e.message}"
    end
  end 
end