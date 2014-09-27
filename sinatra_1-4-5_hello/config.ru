require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'sinatra/base'

class App < Sinatra::Application

  get '/' do
    'Hello!'
  end

end

run App.new
