module ToolsHelper
  def btn_color(tool)
    if tool.loaner
      'btn-loaner'
    else
      tool.in_service ? 'btn-in-service' : 'btn-out-service'
    end
  end

  def tool_count(tabnum)
      return(Tool.all.count) if tabnum == 0
      Tool.where(category_id: tabnum).count
  end

end
