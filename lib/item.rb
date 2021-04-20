class Item
  attr_reader :name,
              :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = convert_price_to_float(attributes)
  end

  def convert_price_to_float(attributes)
    attributes[:price].delete('$').to_f
  end
end