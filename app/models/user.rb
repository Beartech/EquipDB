class User < ActiveRecord::Base
  include TheRoleUserModel

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  #attr_accessible :username, :email, :password, :password_confirmation

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  has_many :dev_logs

  #validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  #validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  #validates_presence_of :username, :email, :role_id
  #validates_uniqueness_of :username, :email, :message => "already in exists in system"
end
