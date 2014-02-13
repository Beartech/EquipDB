class Vehicle < Location
  before_destroy :check_empty

  has_many :tools, :foreign_key => 'location_id'
  validates :name, :presence => true
  validates :name, :uniqueness => true

  def check_empty
    if self.tools.any?
      false
    end
  end

end