require 'sequel'

env = ENV['VORA_DB_ENV'] || 'development'


DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/vora_#{env}")


require './lib/model/song'
