class Service < ActiveRecord::Base
  before_destroy :replace_parts


  belongs_to :tool
  belongs_to :service_type
  has_many :expended_parts, dependent: :destroy
  has_many :parts, through: :expended_parts

  after_create :withdraw_parts



  default_scope order('due_date DESC')



  private

  def replace_parts
    Service.transaction do
      part_list = self.part_ids.uniq
      part_list.delete('')
      part_list.each do |part_id|
        p = Part.find(part_id)
        p.update(inventory: p.inventory + self.part_ids.count(part_id))
      end
    end
  end

  def withdraw_parts
    Service.transaction do
      part_ids = self.part_ids.uniq
      part_ids.each do |part_id|
        p = Part.find(part_id)
        p.update(inventory: p.inventory - self.part_ids.count(part_id) )
      end
    end
  end


end
