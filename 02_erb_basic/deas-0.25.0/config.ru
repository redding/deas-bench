require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'deas'

class App
  include Deas::Server

  root       File.expand_path('..', __FILE__)
  views_root File.expand_path('..', __FILE__)

  get '/', 'App::ErbBasic'

  class ErbBasic
    include Deas::ViewHandler

    def run!
      render 'basic.html'
    end
  end

end

run App.new
