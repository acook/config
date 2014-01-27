#!/usr/bin/env ruby


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

# Output formatting printers

class Pry
  class << self
    attr_accessor :available_printers
  end
  self.available_printers = Hash.new
end

Pry.available_printers[:original] ||= Pry.config.print

begin
  require 'hirb'

  Pry.available_printers[:hirb] = proc do |output, value|
    Hirb::View.view_or_page_output value
  end

  Hirb.enable
rescue LoadError
  # Hirb not installed
end

begin
  require 'awesome_print'

  Pry.available_printers[:awesome] = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output "=> #{value.ai}", output
  end
rescue LoadError
  # AwesomePrint not installed
end

Pry.config.print = proc do |output, value|
  Pry.available_printers.to_a.reverse.find do |name, block|
    block.call output, value
  end
end

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
