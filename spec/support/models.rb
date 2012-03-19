class User < ActiveRecord::Base

  attr_accessor :password_confirmation

  validates :email, :presence => true
  validates :password, :presence => true
  validates :password, :confirmation => true
  validates :username, :presence => true

end
