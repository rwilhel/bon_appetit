require 'pry'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(food)
    stock[:food] = food
    @stock[:amount] ||= 0
  end

  def restock(food, new_amount)
    @stock[:amount] ||= 0
    @stock[:amount] + new_amount
  end
end
