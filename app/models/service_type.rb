class ServiceType < ActiveRecord::Base
  has_and_belongs_to_many :parts

  def default_parts
    my_parts = []
    self.parts.each do |part|
       my_parts << part.name
    end
    my_parts
  end
end
