class Category < ActiveRecord::Base

  has_many :tools
  has_many :dash_views
  validates :name, :presence => true
  validates :name, :uniqueness => true

  private

end