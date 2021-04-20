require './lib/item'

RSpec.describe Item do

  before do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_a(Item)
    end
    it 'has attributes' do
      expect(@item2.name).to eq('Apple Pie (Slice)')
      expect(@item2.price).to eq(2.50)
    end
  end
end


# pry(main)> food_truck = FoodTruck.new("Rocky Mountain Pies")
# #=> #<FoodTruck:0x00007f85683152f0...>

# pry(main)> food_truck.name
# #=> "Rocky Mountain Pies"

# pry(main)> food_truck.inventory
# #=> {}

# pry(main)> food_truck.check_stock(item1)
# #=> 0

# pry(main)> food_truck.stock(item1, 30)

# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}

# pry(main)> food_truck.check_stock(item1)
# #=> 30

# pry(main)> food_truck.stock(item1, 25)

# pry(main)> food_truck.check_stock(item1)
# #=> 55

# pry(main)> food_truck.stock(item2, 12)

# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
# ```
