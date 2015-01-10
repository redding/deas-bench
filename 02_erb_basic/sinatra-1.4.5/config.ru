require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'sinatra/base'
require 'erubis'

class App < Sinatra::Application

  set :views, File.expand_path('..', __FILE__)

  get '/' do
    erb :'basic.html'
  end

end

run App.new
