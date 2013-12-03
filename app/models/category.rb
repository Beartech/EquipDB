class Category < ActiveRecord::Base
  has_many :tools
  validates :name, :presence => true
  validates :name, :uniqueness => true
end