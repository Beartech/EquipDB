module ToolsHelper
  def btn_color(tool)
    if tool.loaner
      'btn-loaner'
    else
      tool.in_service ? 'btn-in-service' : 'btn-out-service'
    end
  end

  def annual_service?(tool)
    tool.services.each do |service|
      if service.completed && service.service_type
        if (service.service_type.name =~ /annual/i || service.service_type.name =~ /New - Put in Service/i) && (service.completed.year == DateTime.now.year)
          return true
        end
      end
    end
    false
  end

  def app_annual_service?(location)
    location.tools.all?{|tool| annual_service?(tool)}
  end

  def tool_count(category)
    if category == 'all'
      Tool.all.count
    else
        Category.find_by(name: category).tools.count
    end
  end

end
