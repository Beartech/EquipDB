class ServiceType < ActiveRecord::Base
  has_many :services
  has_many :parts_service_types
  has_many :parts, through: :parts_service_types


  scope :has_parts, lambda { |*parts|
                   joins(:parts).
                       where(:parts_service_types => { :part_id => parts } ).uniq!.keep_if do |serv|
                     arr = []
                     parts.each { |part| arr << (serv.part_ids.include? part)}
                     arr.all?
                   end
                 }



end
