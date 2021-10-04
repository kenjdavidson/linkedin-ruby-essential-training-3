#!/usr/bin/env ruby

# Mail Merge
# 
# Read a template file which contains a list of a letter
# Read a CSV file which contains details about a person
# Merge the two and save files as a directory

require 'csv'
require 'erb'

class OverdueCheckout
  attr_accessor :first_name, :last_name, :title, :due_date, :fee

  def get_binding 
    binding
  end 
end 

template = File.read('templates/letter.txt.erb')

CSV.foreach('data/overdue.csv') do |row|
  overdue = OverdueCheckout.new
  overdue.first_name = row[0].strip
  overdue.last_name = row[1].strip
  overdue.title = row[2].strip
  overdue.due_date = row[3].strip
  overdue.fee = row[4].strip

  filename = "#{overdue.first_name}_#{overdue.last_name}.txt".downcase
  filepath = File.join('output', filename)
  puts "Creating letter for #{overdue.to_s} as #{filepath}"

  File.open(filepath, 'w') do |file|
    file.puts ERB.new(template).result(overdue.get_binding)
  end 
end