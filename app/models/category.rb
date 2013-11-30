class Category < ActiveRecord::Base
  def self.list
    order(:category).pluck(:category)
  end
end
