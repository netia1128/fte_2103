require './lib/food_truck'
require './lib/event'
require './lib/item'

RSpec.describe FoodTruck do

  before do
    #will remove this hook IF I have time or IF I find a conflict in future iterations
    #currently it appears there are no conflicts though, so keeping now for speed
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
    it 'has attributes' do
      expect(@event.name).to eq('South Pearl Street Farmers Market')
      expect(@event.food_trucks).to eq([])
    end
  end
  describe '#add_food_truck' do
    it 'allows you to add food trucks' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end
  end
  describe '#food_truck_names' do
    it 'will tell you the names of all the foodtrucks at the event' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  describe '#food_trucks_that_sell' do
    it 'tells you which food trucks sell which items' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end
describe '#event_sorted_item_list' do
  it 'Returns a list of names of all items the FoodTrucks have in stock, sorted alphabetically.
      Does not include any duplicate items.' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @food_truck3.stock(@item3, 10)
     expect(@event.event_sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end
  end
  describe '#generate_names_of_items_sold_array' do
    it 'Returns a list of names of all items the FoodTrucks have in stock' do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @food_truck3.stock(@item3, 10)
       expect(@event.generate_names_of_items_sold_array).to eq([["Peach Pie (Slice)", "Apple Pie (Slice)"], ["Banana Nice Cream", "Peach-Raspberry Nice Cream"], ["Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]])
    end
  end
  describe '#generate_items_sold_array' do
    it 'Returns a list of names of all items the FoodTrucks have in stock' do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @food_truck3.stock(@item3, 10)
       expect(@event.generate_items_sold_array.count).to eq(4)
    end
  end
  describe '#total_inventory' do
    it ' reports the quantities of all items sold at the event.' do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @food_truck3.stock(@item3, 10)
       expect(@event.total_inventory.count).to eq(4)
    end
  end

  describe '#overstocked_items' do
    it 'tells you if an item is oversrtocked' do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @food_truck3.stock(@item3, 10)
       expect(@event.oversrtocked_items).to eq(4)
    end
  end
end



# You Event will also be able to identify overstocked_items. An item is overstocked if it is sold by more than 1 food truck AND the total quantity is greater than 50.

# Use TDD to update your Event class so that it responds to the following interaction pattern:


# pry(main)> event.total_inventory
# #=> {
#   #   #<Item:0x007f9c56740d48...> => {
#   #     quantity: 100,
#   #     food_trucks: [#<FoodTruck:0x00007fe1348a1160...>, #<FoodTruck:0x00007fe134910650...>]
#   #   },
#   #   #<Item:0x007f9c565c0ce8...> => {
#   #     quantity: 7,
#   #     food_trucks: [#<FoodTruck:0x00007fe1348a1160...>]
#   #   },
#   #   #<Item:0x007f9c56343038...> => {
#   #     quantity: 50,
#   #     food_trucks: [#<FoodTruck:0x00007fe1349bed40...>]
#   #   },
#   #   #<Item:0x007f9c562a5f18...> => {
#   #     quantity: 35,
#   #     food_trucks: [#<FoodTruck:0x00007fe1349bed40...>, #<FoodTruck:0x00007fe134910650...>]
#   #   },
#   # }

# pry(main)> event.overstocked_items
# #=> [#<Item:0x007f9c56740d48...>]
