require './app/controllers/recipes_controller'
require './spec/spec_helper'

class RecipesControllerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    RecipesController
  end

  def test_it_returns_12_recipes
    skip
    request = get "/recipes/complexSearch"
    response = JSON.parse(request.body, symbolize_names: true)
    assert_equal 12, response.size
  end

  def test_it_returns_a_specific_recipe
    skip
    request = get "/recipe/1"
    response = JSON.parse(request.body, symbolize_names: true)
    assert_equal 1, response[:id]
    assert response[:title]
    assert response[:time]
    assert response[:ingredients]
    assert response[:instructions]
  end

  def test_it_returns_multiple_recipes_by_id
    skip
    request = get "/recipes?ids=1,2,5"
    response = JSON.parse(request.body, symbolize_names: true)
    assert_equal 3, response.size
    ids = response.reduce([]) do |acc, recipe|
      acc << recipe[:id]
    end
    assert_equal [1,2,5], ids
  end

  def test_it_returns_nil_if_invalid_recipe
    request = get "/recipe/12312312313"
  end
end
