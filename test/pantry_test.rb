require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_stock_hash
    pantry = Pantry.new

    assert pantry.stock
  end

  def test_it_can_check_for_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_restock
    pantry = Pantry.new

    assert_equal 10, pantry.restock("Cheese", 10)
  end

  def test_it_can_restock_and_add_to_existing_amount
    pantry = Pantry.new

    pantry.stock[:amount] = 10
    assert_equal 30, pantry.restock("Cheese", 20)
  end

  def test_it_can_create_new_recipe
    r = Recipe.new("Cheese Pizza")

    assert_instance_of Recipe, r
  end
end
