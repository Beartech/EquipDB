class Inventory

  def initialize(arr)
    @array = arr
  end

  def inventory_hash  #count occurrences of each part number
    @inv_hash = {}
    @array.uniq.each do |item|
      @inv_hash[item] = @array.count(item)
    end
    @inv_hash
  end

  def replace_aliases   #check for aliases in DB and change to main part number

  end

  # Move rejected numbers to array. Start transaction -
  # Add record to transaction table (date, type, user_id). Add record to parts_transactions table
  # for each part(transaction_id, part_id, quantity), update parts quantity in Parts table.
  # End transaction
  def build_inventory

  end

end