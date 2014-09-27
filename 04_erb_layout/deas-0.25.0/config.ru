require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'deas'

class App
  include Deas::Server

  root       File.expand_path('..', __FILE__)
  views_root File.expand_path('..', __FILE__)

  get '/', 'App::ErbWithLayout'

  class ErbWithLayout
    include Deas::ViewHandler

    layout 'layout.html'

    def run!
      render 'basic_w_layout.html'
    end
  end

end

run App.new
