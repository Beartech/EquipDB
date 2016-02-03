module ToolsHelper
  def btn_color(tool)
    if tool.loaner
      'btn-loaner'
    else
      tool.in_service ? 'btn-in-service' : 'btn-out-service'
    end
  end

  def annual_service?(tool_id)
    @ann_serv_comp.include? tool_id  #@ann_serv_comp is returned by Dashboard controller
  end

  def app_annual_service?(tools)
    tools.all?{|tool| annual_service?(tool.id)}  #checks all tools using annual_service? helper
  end                                            #shown above.

  def tool_count(category)
    if category == 'all'
      Tool.all.count
    else
        Category.find_by(name: category).tools.count
    end
  end

end
