class Station < Location
  before_destroy :check_empty

  has_many :tools, :foreign_key => 'location_id'
  validates :name, :presence => true
  validates :name, :uniqueness => true

  private

  def check_empty
    if self.tools.any?
      false
    end
  end

end
