class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services
  belongs_to :category
  belongs_to :location
  accepts_nested_attributes_for :repairs
  accepts_nested_attributes_for :services

  validates :serial, :uniqueness => true
  validates :serial,  :presence => true

  def self.location_group(app)
    loc = Location.find_by_name(app)
    where('location_id = ?', loc.id).order(:name)
  end

  def self.loaner_tools
    loc = Location.find_by_name('Loaners')
    where('location_id = ?', loc.id).order(:name)
  end

  def self.swap_tools(app_params)
    if app_params['apparatus']['relocate']
      loc_id = Location.where(name: app_params['apparatus']['location'])
      Tool.where(id: app_params['apparatus']['relocate']).update_all(location_id: loc_id)
    end

    if app_params['apparatus']['swap']
      Tool.where(id: app_params['apparatus']['swap']).update_all(location_id: Location.where(name: app_params[:app]))
    end
  end

  def category_id?(name)
    c = Category.find_by_name(name)
    c.id
  end

  def location_id?(loc)
    l = Location.find_by_name(loc)
    l.id
  end

end