class Tool < ActiveRecord::Base
  has_many :repairs
  has_many :services
  has_many :parts, :through => :repairs
  has_many :parts, :through => :services

  accepts_nested_attributes_for :repairs
  accepts_nested_attributes_for :services

  #validates :name, :serial, :purchased, :cost, :value, :condition, :presence => true

  def self.location_group(app)
    where('location = ?', app)
  end

  def self.loaner_tools
    where('loaner = ?', true)
  end

  def self.swap_tools(app_params)
    if app_params['apparatus']['relocate']
      Tool.update_all({location: app_params['apparatus']['location']}, {id: app_params['apparatus']['relocate']})
    end

    if app_params['apparatus']['swap']
      Tool.update_all({location: app_params[:app]}, {id: app_params['apparatus']['swap']})
    end
  end

end