class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services


  accepts_nested_attributes_for :repairs
  accepts_nested_attributes_for :services

  #validates :name, :serial, :purchased, :cost, :value, :condition, :presence => true

  def self.location_group(app)
    where('location = ?', app).order(:name)
  end

  def self.loaner_tools
    where('location = ?', 'Loaners').order(:name)
  end

  def self.swap_tools(app_params)
    if app_params['apparatus']['relocate']
      Tool.where(id: app_params['apparatus']['relocate']).update_all(location: app_params['apparatus']['location'])
    end

    if app_params['apparatus']['swap']
      Tool.where(id: app_params['apparatus']['swap']).update_all(location: app_params[:app])
    end
  end

end