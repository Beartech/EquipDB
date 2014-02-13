class UpdateToolCondition < ActiveRecord::Migration
  def change
    tools = Tool.all
    tools.each do |tool|
      case tool.condition
        when '1'
          tool.condition = '1 - Needs To Be Replaced'
        when '2'
          tool.condition = '2 - Marginal'
        when '3'
          tool.condition = '3 - Serviceable'
        when '4'
          tool.condition = '4 - Good Condition'
        when '5'
          tool.condition = '5 - Brand New Condition'
        else
          tool.condition
      end
      tool.save
    end

  end
end
