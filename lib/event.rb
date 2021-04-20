class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.item_sold?(item)
    end
  end

  def generate_names_of_items_sold_array
    @food_trucks.map do |food_truck|
      food_truck.names_of_items_sold
    end
  end

  def generate_items_sold_array
    items_sold_array = @food_trucks.map do |food_truck|
      food_truck.items_sold
    end
    items_sold_array.flatten.uniq
  end

  def event_sorted_item_list
    array = generate_names_of_items_sold_array
    array.flatten.sort.uniq
  end

  def total_inventory
    items_sold_array = generate_items_sold_array
    items_sold_array.each_with_object({}) do |item, hash|
      hash[item] = total_inventory_helper(item)
    end
  end

  def total_inventory_helper(item)
    food_truck_array = []
    @food_trucks.each_with_object(Hash.new(0)) do |food_truck, hash|
      if food_truck.item_sold?(item)
        hash[:quantity] += food_truck.inventory.fetch(item)
        hash[:food_truck] = food_truck_array << food_truck
      end
    end
  end

  def oversrtocked_items
    #would use total inventory to see if it met criteria, probably with find all

    end
  end
end