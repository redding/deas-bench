require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'sinatra/base'

class App < Sinatra::Application

  (1..100).each do |i1|
    (1..3).each do |i2|
      route = (1..i2).inject("/#{i1}"){ |r, t| r += "/#{t}"; r }
      get route do
        'Hello!'
      end
    end
  end

  get '/' do
    'Hello!'
  end

end

run App.new
