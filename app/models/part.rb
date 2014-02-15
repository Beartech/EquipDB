class Part < ActiveRecord::Base
  has_and_belongs_to_many :service_types
  has_many :part_aliases
  accepts_nested_attributes_for :part_aliases
  has_many :expended_parts

  validates :sku, uniqueness: true


end
