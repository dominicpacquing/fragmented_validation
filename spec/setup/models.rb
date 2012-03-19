require 'active_model'

class Person
  include ActiveModel::Validations

  attr_accessor :username, :password, :password_confirmation
  attr_accessor :email

  validates :email, :presence => true
  validates :password, :presence => true
  validates :password, :confirmation => true
  validates :username, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    {:username => username, :password => password}
  end

end
