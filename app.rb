
require 'sinatra'
require 'active_record'
require 'yaml'
require_relative 'projects_api'
require_relative 'tasks_api'


database_config = ENV['DATABASE_URL']

if database_config.blank?
  database_config = YAML::load(File.open('config/database.yml'))
end

ActiveRecord::Base.establish_connection(database_config)

after do
  ActiveRecord::Base.connection.close
end
