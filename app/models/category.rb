class Category < ActiveRecord::Base

  has_many :tools
  has_many :dash_views
  validates :name, :presence => true
  validates :name, :uniqueness => true

  def update_cat(dropdown_params)
    if dropdown_params[:delete_me] == '1'
      @cat = Category.find_by_name(dropdown_params[:add_category].titleize)
      @cat.destroy
    else
      @cat = Category.new(name: dropdown_params[:add_category].titleize) unless dropdown_params[:add_category] == ''
    end
  end



  private

  def check_empty
    if self.tools.any?
      false
    end
  end
end