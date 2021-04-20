class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if inventory.has_key?(item)
      inventory.fetch(item)
    else
      0
    end
  end

  def stock(item, quantity)
    inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do |inventory_item|
      inventory_item.first.price * inventory_item.last
    end
  end

  def items_sold
    @inventory.map do |inventory_item|
      inventory_item.first
    end
  end

  def names_of_items_sold
    @inventory.map do |inventory_item|
      inventory_item.first.name
    end
  end

  def item_sold?(item)
    items_sold.include?(item)
  end
end