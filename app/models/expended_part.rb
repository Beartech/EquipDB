class ExpendedPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :service
end
