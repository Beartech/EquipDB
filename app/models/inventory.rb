class Inventory

  attr_reader :inv_hash, :unknown_sku, :array

  def initialize(arr)
    @array = arr
    @inv_hash = {}
    @array.uniq.each do |item|
      @inv_hash[item] = @array.count(item)
    end
    @unknown_sku = {}
  end

  def commit_inventory_transaction(operator)
    Part.transaction do
      @inv_hash.each do |k,v|
        if p = Part.find_by(sku: k)
          p.update(inventory: p.inventory.send(operator, v) )
        elsif pa = PartAlias.find_by(sku: k)
          if p = Part.find_by(pa.id)
            p.update(inventory: p.inventory.send(operator, v) )
          end
        else
          @unknown_sku[k] = v
        end
      end
    end
  end
private


  # Move rejected numbers to array. Start transaction -
  # Add record to transaction table (date, type, user_id). Add record to parts_transactions table
  # for each part(transaction_id, part_id, quantity), update parts quantity in Parts table.
  # End transaction


end