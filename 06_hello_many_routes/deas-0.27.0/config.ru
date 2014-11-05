require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'deas'

class App
  include Deas::Server

  root File.expand_path('..', __FILE__)

  (1..100).each do |i1|
    (1..3).each do |i2|
      route = (1..i2).inject("/#{i1}"){ |r, t| r += "/#{t}"; r }
      get route, 'App::Hello'
    end
  end

  get '/', 'App::Hello'

  class Hello
    include Deas::ViewHandler

    def run!
      'Hello!'
    end
  end

end

run App.new
