class ServiceType < ActiveRecord::Base
  belongs_to :service
  belongs_to :repair
  has_and_belongs_to_many :parts

  def default_parts
    my_parts = []
    self.parts.each do |part|
       my_parts << part.name
    end
    my_parts
  end
end
