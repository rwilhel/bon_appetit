require 'pry'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(args)
  end

  def stock_check(food)
    @stock[:food] = food
    @stock[:amount] = 0
  end

  def restock(food, amount)
    @stock[:food]
    binding.pry
    @stock.values

  end
end
