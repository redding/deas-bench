require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'deas'
require 'erubis'

class App
  include Deas::Server

  root       File.expand_path('..', __FILE__)
  views_root File.expand_path('..', __FILE__)

  get '/', 'App::ErbWithLayoutAndPartial'

  class ErbWithLayoutAndPartial
    include Deas::ViewHandler

    layout 'layout.html'

    def run!
      render 'basic_w_layout_and_partial.html'
    end
  end

end

run App.new
