
require_relative 'list_dir'
require_relative 'list_file'

module MultilistMaker
  class Controller

    @@valid_actions = ["view", "add", "edit", "remove", "load", "quit"]

    def initialize
      @list_dir = MultilistMaker::ListDir.new
      @list_file = MultilistMaker::ListFile.new
    end

    def launch!
      introduction

      do_action('load', [])

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
        puts "#{@list_file.listname.capitalize}"
        puts "Action: #{@@valid_actions.join(', ')}"
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
        @list_file.add
      when "edit"
        @list_file.edit args
      when "remove"
        @list_file.remove args
      when "load"
        new_file = @list_dir.choose_list
        @list_file = MultilistMaker::ListFile.new(new_file)
      else 
        puts "Sorry, #{action} is not an option."
      end 

      rescue ArgumentError => e
        puts "Oops! #{e.message}"
    end
  end 
end