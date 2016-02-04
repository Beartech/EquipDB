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

  def app_annual_service?(app)
    cats = Category.where(ann_serv: true).pluck(:id)
    loc = Location.where(name: "#{app}")
    all_tools = loc.first.tools
    annual_tools = all_tools.keep_if {|tool| cats.include? tool.category_id}
    annual_tools.all? {|tool| annual_service?(tool.id)}
  end

  def tool_count(category)
    if category == 'all'
      Tool.all.count
    else
        Category.find_by(name: category).tools.count
    end
  end

end
