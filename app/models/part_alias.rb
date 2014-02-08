class PartAlias < ActiveRecord::Base
  belongs_to :part

  validates :sku, uniqueness: true

end
