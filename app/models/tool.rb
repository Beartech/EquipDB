class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services
  has_many :parts, :through => :repairs
  has_many :parts, :through => :services
end
