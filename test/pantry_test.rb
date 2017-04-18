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

  def test_it_can_add_ingredients_to_recipe
    r = Recipe.new("Cheese Pizza")

    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    assert_equal ["Cheese", "Flour"], r.ingredient_types
    assert_equal [20, 20], r.ingredients.values
  end

  def test_it_can_add_recipe_to_shopping_list
    r = Recipe.new("Cheese Pizza")
    pantry = Pantry.new
    @name = "Cheese Pizza"
    @ingredients = {}

    assert_equal r, pantry.add_to_shopping_list(r)
  end

  def test_it_can_check_shopping_list
    r = Recipe.new("Cheese Pizza")
    pantry = Pantry.new
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
  
    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end
end
