
module MultilistMaker
  class ListDir
    @@default_directory = 'lm_lists'

    def self.dirname
      File.join(APP_ROOT, @@default_directory)
    end 

    attr_reader :files

    # Find directory or create it if it doesn't exist
    # Locate list of directories in APP_ROOT and confirm it's readable and writable
    def initialize 
      if Dir.exist? self.class.dirname
        raise "Directory is not readable" unless File.readable? self.class.dirname
        raise "Directory is not writable" unless File.writable? self.class.dirname
      else 
        Dir.mdkir self.class.dirname
      end 

      refresh_cached_files
    end 

    # Display list of files with numbers.  Ask user to choose a number
    # User can also type add to add a new list
    def choose_list
      puts "Please choose which list you would like to use."
      list
      puts "Or type 'add' in order to create a new list."      
      print "> "
    
      input = gets.chomp 
      case input
      when "add"
        add
      else 
        begin
          raise "#{input} is not a valid number" unless input.match?(/[0-9]+/)
          index = input.to_i - 1 
          raise "#{index} is not a valid selection" unless (0...@files.length).include?(index)
          return @files[index]
        rescue => e
          puts e.message      
        end
      end 
    end 

    def list 
      puts "-" * 60
      @files.each_with_index do |filename, i| 
        puts "#{i+1}: #{filename}"
      end 
      puts "-" * 60
    end 

    def add
      puts "Enter a filename you would like to use."
      puts "Names should be lowercase with underscores."
      puts "Example: grocery_list.txt"
      print "> "

      filename = gets.chomp
      filepath = File.join(self.class.dirname, filename)
      
      unless File.exist? filepath
        File.new(filepath, 'w+').close
        refresh_cached_files
      end 

      filename
    end 

    # Dir.entries or Dir.glob
    def refresh_cached_files
      @files = Dir.glob("*.txt", base: self.class.dirname)
    end 
  end 
end 