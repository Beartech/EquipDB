class Dropdown < ActiveRecord::Base
  serialize :list, Array

end
