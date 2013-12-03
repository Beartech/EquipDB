class Station < Location
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
