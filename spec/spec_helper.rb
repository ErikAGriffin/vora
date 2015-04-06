ENV['VORA_DB_ENV'] = 'test'

require './server'
require 'capybara/rspec'

Capybara.app = Server

RSpec.configure do |config|

  config.around :each do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end

end
