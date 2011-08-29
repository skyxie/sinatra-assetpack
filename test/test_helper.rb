require 'contest'
require 'jsmin'
require 'rack/test'
require 'yaml'
require 'mocha'

require File.expand_path('../../example/app.rb', __FILE__)

class UnitTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Main
  end

  def d
    puts "-"*80
    puts "#{last_response.status}"
    y last_response.original_headers
    puts "-"*80
    puts ""
    puts last_response.body.gsub(/^/m, '    ')
    puts ""
  end

  def body
    last_response.body.strip
  end
end
