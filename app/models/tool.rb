class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services
  has_many :parts, :through => :repairs
  has_many :parts, :through => :services

  accepts_nested_attributes_for :repairs
  accepts_nested_attributes_for :services
end
