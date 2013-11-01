module ToolsHelper
  def btn_color(tool)
    if tool.loaner
      "btn-loaner"
    else
      tool.in_service ? "btn-in-service" : "btn-out-service"
    end
  end

end
