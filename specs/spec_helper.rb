ENV['VORA_DB_ENV'] = 'test'
require './sever'
require 'capybara/rspec'

Capybara.app = Server

RSpec.configure do |config|

end
