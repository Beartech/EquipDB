class Repair < ActiveRecord::Base
  belongs_to :tool
  has_many :parts
end
