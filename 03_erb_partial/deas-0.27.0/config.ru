require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'deas'
require 'erubis'

class App
  include Deas::Server

  root       File.expand_path('..', __FILE__)
  views_root File.expand_path('..', __FILE__)

  get '/', 'App::ErbPartial'

  class ErbPartial
    include Deas::ViewHandler

    def run!
      render 'basic_w_partial.html'
    end
  end

end

run App.new
