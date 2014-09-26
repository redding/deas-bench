require 'rubygems'

# Set up gems listed in the Gemfile.
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'deas'

class Hello
  include Deas::ViewHandler

  def run!
    'Hello!'
  end

end

class App
  include Deas::Server

  root File.expand_path('..', __FILE__)

  get '/', 'Hello'

end

run App.new
