#!/usr/bin/env ruby

require 'erb'

class BindingTest
  attr_reader :x, :y, :result

  def initialize(x, y)
    @x = x
    @y = y 
    @result = x * y
  end 

  def get_binding
    binding
  end
end 

template = "<%= @x %> * <%= @y %> = <%= @result %>"
renderer = ERB.new(template)
puts renderer.result(BindingTest.new(2, 2).get_binding)
puts renderer.result(BindingTest.new(3, 3).get_binding)