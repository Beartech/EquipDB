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

  def annual_service?(tool)
    tool.services.each do |service|
      if service.completed
        if (service.service_type.name =~ /annual/i) && (service.completed.year == DateTime.now.year)
          return true
        end
      end
    end
    false
  end

  def app_annual_service?(app)
    app.tools.each do |tool|
      return false unless annual_service?(tool)
    end
    true
  end

end
