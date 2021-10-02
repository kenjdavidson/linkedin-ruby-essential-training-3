#!/usr/bin/env ruby

# Multilist Maker
# User can choose from the known list
# User can add to the list

# Constant of where our "application" is based
APP_ROOT = File.expand_path(File.dirname(__FILE__))

require_relative 'multilist_maker/controller'

controller = MultilistMaker::Controller.new
controller.launch!