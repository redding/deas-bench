require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'sinatra/base'
require 'erubis'

class App < Sinatra::Application

  set :views, File.expand_path('..', __FILE__)

  get '/' do
    erb :'layout.html' do
      erb :'basic_w_layout_and_partial.html'
    end
  end

end

run App.new
