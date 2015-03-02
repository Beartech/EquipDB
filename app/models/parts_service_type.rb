class PartsServiceType < ActiveRecord::Base
  belongs_to :part
  belongs_to :service_type
  has_many :part_lookups, class_name: 'PartsServiceType',
                          foreign_key: 'service_type_id'


end