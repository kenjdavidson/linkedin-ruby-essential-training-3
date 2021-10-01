#!/usr/bin/env ruby

puts "******* File Paths *********"
puts "This file (relative): #{__FILE__}"
puts "This file (absolute): #{File.expand_path(File.dirname(__FILE__))}"
puts "This file (absolute): #{__dir__}"

puts "******* File Permissions *********"