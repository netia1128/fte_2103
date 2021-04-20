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
end