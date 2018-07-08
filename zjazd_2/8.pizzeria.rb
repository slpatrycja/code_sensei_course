class Pizzeria
  attr_reader :pizzas, :balance

  def initialize(pizza_names)
    @balance = 0
    @pizzas = []

    pizza_names.each do |pizza_name|
      add_pizza(pizza_name)
    end
  end

  def make_order(user, pizzas)
    pizzas.each do |pizza|
      if @pizzas.include?(pizza) && user.balance >= pizza.price
        user.balance -= pizza.price
        @balance += pizza.price
        puts "User kupił pizze #{pizza.name}"
      end
    end
  end

  def add_pizza(pizza_name)
		@pizzas.push(
      Pizza.new(pizza_name, 20, 32),
      Pizza.new(pizza_name, 30, 42),
      Pizza.new(pizza_name, 40, 52)
    )
	end

	def remove_pizza(pizza_name)
		@pizzas.delete_if do |pizza|
			pizza.name == pizza_name
		end
	end
end

class Pizza
  attr_reader :name, :price, :size

  def initialize(name, price, size)
    @name = name
    @price = price
    @size = size
  end

  def to_s
    "name: #{@name}, price: #{@price}, size: #{size}"
  end

  def ==(other)
    name == other.name &&
    price == other.price &&
    size == other.size
  end
end

class User
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end
end

pizza_names = ["Margarita", "Capricossa", "Parma", "Kebab"]

pizzeria = Pizzeria.new(pizza_names)
puts pizzeria.pizzas
puts "******************"
user = User.new(60)
user_pizzas = [
  Pizza.new('Capricossa', 20, 32),
  Pizza.new('Parma', 40, 52)
]
pizzeria.make_order(user, user_pizzas)
puts "User balance: #{user.balance}"
puts "Pizzeria balance: #{pizzeria.balance}"
