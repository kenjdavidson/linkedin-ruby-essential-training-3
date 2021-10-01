#!/usr/bin/env ruby

# List Maker Challenge
# Interactive program for managing a saved list
# Finds a list file
# User can view, add, edit the list

# Constant of where our "application" is based
APP_ROOT = File.expand_path(File.dirname(__FILE__))

require_relative 'list_maker/controller'

controller = ListMaker::Controller.new
controller.launch!