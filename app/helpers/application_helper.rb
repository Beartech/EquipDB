module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "#{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    if css_class == "asc"
      header_class = "headerSortDown"
    elsif css_class == "desc"
      header_class = "headerSortUp"
    end

    content_tag("th", title, :"data-link" => url_for(params.merge(:sort => column, :direction => direction, :page => nil)), :class => "header multiSort #{header_class}")

  end
end
