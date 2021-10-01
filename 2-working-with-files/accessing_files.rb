#!/usr/bin/env ruby

File.open('groceries.txt', 'w') do |file|
  file.puts "Grocery List"
  file.print "+ butter\n"
  file.write "+ milk\n"
  file << "+ sugar"
end 

# Better way of handling lines
puts "Reading Groceries!"
File.open('groceries.txt','r') do |file|
  file.each_line do |line| 
    puts line
  end 
end