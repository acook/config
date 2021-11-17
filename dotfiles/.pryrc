#!/usr/bin/env ruby

require 'win32console' if RUBY_PLATFORM =~ /mswin|mingw|cygwin/i
require 'pathname'

# Use vim as my editor
Pry.config.editor = 'vim'
# Set the pry-theme
Pry.config.theme = 'monokai'

# My pry is polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version and object information

def Pry.object_info object
  if object == Object || object.class == Object then
    "#{object.class}##{object.inspect}"
  elsif object.is_a? Class then
    "#{object.class}##{object.superclass}/#{object.name}"
  elsif object.is_a? Module then
    "#{object.class}##{object.name}"
  elsif defined?(RSpec) && defined?(RSpec::Core) && object.is_a?(RSpec::Core::ExampleGroup) then
    "RSpec::Core::ExampleGroup#instance"
  else
    "#{object.class.superclass}/#{object.class}#instance"
  end
end

Pry.config.prompt = Pry::Prompt.new(
  :obj_info,
  "Display local object in prompt similar to the PWD in a command shell.",
  [
    proc { |object, nest_level|
      "#{"#{nest_level} " unless nest_level.zero?}#{Pry.object_info object} > "
    },
    proc { |object, nest_level|
      "#{nest_level} * "
    }
  ]
)

# Output formatting printers
begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError
  # AwesomePrint not installed
end

# Launch Pry with access to the entire Rails stack.
unless defined? Rails
  if Pathname.pwd.join('config', 'application.rb').exist? then
    puts 'Rails environment available. Type `rails!` to get access to the full stack.'

    def self.rails!
      puts "[INFO] loading Rails..."

      require './config/application'
    end
  end
end
