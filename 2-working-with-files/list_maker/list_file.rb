
module ListMaker
  class ListFile 
    DEFAULT_FILENAME = 'lm_list.txt'

    # Locate the list file and confirm it's read/writable
    # if possible then open it and return self
    def initialize(filename = DEFAULT_FILENAME)
      @filename = File.join(APP_ROOT, filename)

      validate_file
    end 

    # Read from the file, adding numbers next to the list item
    def view       
      puts
      puts "VIEW LIST"

      items.each_with_index do |item, index| 
        puts "#{index+1}. #{item}"
      end
    end 

    # Add item to the end of list
    def add(args=[])
      raise ArgumentError.new "Add requires an item" unless args.length > 0

      puts
      puts "ADDING #{args[0]}"
      File.open(@filename, 'a') do |file|
        file.puts args.shift
      end 
    end 

    # get the position of the item they want to edit
    # edit and replace
    def edit(args=[])
      raise ArgumentError.new "Edit requires the item number you wish to edit" unless args.length > 0

      item_list = items
      index = args[0].to_i - 1

      if item_list.length < index + 1
        puts "There is no item #{args[0]}"
      else 
        puts
        puts "EDITING ITEM #{args[0]}"
        puts "#{args[0]} > #{item_list[index]}"
        print " > "
        item_list[index] = gets

        File.write(@filename, item_list.join)
      end
    end    

    def remove(args=[]) 
      raise ArgumentError.new "Edit requires the item number you wish to edit" unless args.length > 0

      item_list = items
      index = args[0].to_i - 1

      puts
      puts "REMOVING ITEM #{args[0]} #{item_list[index]}"
      
      if item_list.length < index + 1
        puts "There is no item #{args[0]}"
      else 
        puts
        item_list.drop index

        File.write(@filename, item_list.join)
      end
    end 

  private 

    def items 
      validate_file 
      File.readlines(@filename)
    end 

    def validate_file(mode = 'r')
      unless File.exist? @filename 
        File.new(@filename, 'w+').close
      end 
    end 
  end 
end 