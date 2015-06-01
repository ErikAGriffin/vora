ENV['VORA_DB_ENV'] = 'test'

require './server'
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = Server

DB = Sequel.connect("postgres://localhost/vora_test");

RSpec.configure do |config|


  # What is this doing, does this clean the database?
  config.around :each do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end

  # If not..

#   config.before(:suite) do
#     DatabaseCleaner.strategy = :transaction
#     DatabaseCleaner.clean_with(:truncation)
#   end

#   config.before(:each) do
#     DatabaseCleaner.start
#   end

#   config.after(:each) do
#     DatabaseCleaner.clean
#   end


end
