#!/usr/bin/env ruby

require 'erb'

renderer = ERB.new("The year is <%= Time.now.year %>.")
puts renderer.result

