require 'pry'
require './lib/recipe'

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

  def add_to_shopping_list(r)
    Recipe.new(@name)
  end
end
