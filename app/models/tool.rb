class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services
  has_many :parts, :through => :repairs
  has_many :parts, :through => :services

  accepts_nested_attributes_for :repairs
  accepts_nested_attributes_for :services

  validates :name, :serial, :purchased, :cost, :value, :condition, :presence => true


  def self.search(search)
    if search
      where('serial LIKE ?', "%#{search}%")
    else
      all
    end
  end
end