class PartAlias < ActiveRecord::Base
  belongs_to :part

  validates_presence_of :sku, :part_id
  validates :sku, uniqueness: true

end
