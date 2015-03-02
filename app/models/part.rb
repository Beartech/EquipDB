class Part < ActiveRecord::Base
  has_many :parts_service_types
  has_many :service_types, through: :parts_service_types
  has_many :part_aliases
  accepts_nested_attributes_for :part_aliases
  has_many :expended_parts

  validates :sku, uniqueness: true
  validates_presence_of :inventory, :minimum, :maximum


  scope :has_serv_types, lambda { |*servs|
                         joins(:service_types).
                             where(:parts_service_types => { :service_type_id => servs } )
                       }


  def sku_name
    "#{self.name} / #{self.sku}"
  end


end
