class Product
  attr_accessor :id, :name, :description, :price

  def initialize(id, name, description, price)
    @id = id
    @name = name
    @description = description
    @price = price
  end
end


class ShoppingCartItem
  attr_accessor :product, :quantity, :discount_strategy

  def initialize(product, quantity, discount_strategy = NoDiscountStrategy.new)
    @product = product
    @quantity = quantity
    @discount_strategy = discount_strategy
  end

  def calculate_total
    @discount_strategy.calculate_total(@product, @quantity)
  end
end


class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def calculate_total
    @items.sum { |item| item.calculate_total.to_f }
  end
end


class DiscountStrategy
  def calculate_total(product, quantity)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end
end


class NoDiscountStrategy < DiscountStrategy
  def calculate_total(product, quantity)
    product.price.to_f * quantity
  end
end


class TwentyPercentOffDiscountStrategy < DiscountStrategy
  def calculate_total(product, quantity)
    total_pre_discount = product.price.to_f * quantity
    discount_amount = total_pre_discount * 0.2
    total_pre_discount - discount_amount
  end
end


class HalfOffDiscountStrategy < DiscountStrategy
  def calculate_total(product, quantity)
    total_pre_discount = product.price.to_f * quantity
    discount_amount = total_pre_discount * 0.5
    total_pre_discount - discount_amount
  end
end


product_a = Product.new(1, "Product A", "Lorem ipsum...", 10.99)
product_b = Product.new(1, "Product A", "Lorem ipsum...", 20)
product_c = Product.new(1, "Product A", "Lorem ipsum...", 39.99)

item_a = ShoppingCartItem.new(product_a, 2)
item_b = ShoppingCartItem.new(product_b, 1, HalfOffDiscountStrategy.new)
item_c = ShoppingCartItem.new(product_c, 3, TwentyPercentOffDiscountStrategy.new)

cart = ShoppingCart.new

cart.add_item(item_a)
cart.add_item(item_b)
cart.add_item(item_c)

puts "Cart Total: $#{cart.calculate_total}"

