module PartsHelper
  def inventory_indicator(part)

      if part.inventory > part.minimum
        raw('<span class="label label-large label-success">Good</span>')
      elsif part.inventory == part.minimum
        raw('<span class="label label_large label-warn">Low</span>')
      elsif part.inventory < part.minimum
        raw('<span class="label label-large label-important">Warning</span>')
      end

  end

  def inventory_badge(part)
    if part.inventory > part.minimum
      'badge-success'
    elsif part.inventory == part.minimum
      'badge-warn'
    elsif part.inventory < part.minimum
      'badge-important'
    end
  end

  def run_inventory
    parts = Part.all
    inventory = []
    parts.each do |part|
      inventory << part if part.inventory <= part.minimum
    end
    inventory
  end


end
