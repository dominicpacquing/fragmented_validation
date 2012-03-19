require 'fragmented_validation'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3",
                                       :database => File.dirname(__FILE__) + "/fragmented_validation.sqlite3")

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
require 'rspec'


RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end


