require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'deas'

class App
  include Deas::Server

  root File.expand_path('..', __FILE__)

  get '/', 'App::Hello'

  class Hello
    include Deas::ViewHandler

    def run!
      'Hello!'
    end
  end

end

run App.new
