class ExpendedPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :service
  delegate :tool, to: :service
end
