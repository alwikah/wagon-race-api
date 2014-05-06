require 'pg'
require 'active_record'
require 'pathname'
require 'open-uri'
require 'yaml'
require 'erb'

# gets root of current directory
APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

# loads the yml database config file
DB_CONFIG = YAML::load(ERB.new(File.read(File.join(File.dirname(__FILE__),'database.yml'))).result)

# gets the path of the database
DB_PATH =  APP_ROOT.join(DB_CONFIG["production"]["database"])

ActiveRecord::Base.configurations = DB_CONFIG
ActiveRecord::Base.establish_connection('production')
