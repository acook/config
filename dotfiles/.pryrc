#!/usr/bin/env ruby


begin
  require 'hirb'
rescue LoadError
  # no pretty console output :(
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end


# Load plugins (only those I whitelist)
#Pry.config.should_load_plugins = false
#Pry.plugins["doc"].activate!
#Pry.plugins["theme"].activate!
require 'win32console' if RUBY_PLATFORM =~ /mswin|mingw|cygwin/i

# Use vim as my editor
Pry.config.editor = 'vim'
# Set the pry-theme
Pry.config.theme = 'monokai'

# My pry is polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.prompt = [
  proc { |object, nest_level|

    object_info = if object == Object || object.class == Object then
      "#{object.class}##{object.inspect}"
    else

      if object.is_a? Class then
        "#{object.class}##{object.superclass}/#{object.name}"
      elsif object.is_a? Module then
        "#{object.class}##{object.name}"
      elsif defined?(RSpec) && defined?(RSpec::Core) && object.is_a?(RSpec::Core::ExampleGroup) then
        "RSpec::Core::ExampleGroup#instance"
      else
        "#{object.class.superclass}/#{object.class}#instance"
      end
    end

    "#{RUBY_VERSION} (#{object_info}):#{nest_level} > "
  },
  proc { |object, nest_level|
    "#{RUBY_VERSION} #{nest_level} * "
  }
]

# Toy methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
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
