require './app/services/spoonacular_service'
require './app/serializers/recipe_serializer'
require 'sinatra'

class RecipesController < Sinatra::Base

  get '/recipes/complexSearch' do
    recipes = SpoonacularService.new.complex_search(params)

    return nil if recipes.nil?

    recipes = recipes[:results].map { |recipe| RecipeSerializer.call(recipe) }.to_json
  end

  get "/recipe/:recipe_id" do
    recipe = SpoonacularService.new.search_by_id(params[:recipe_id])

    return nil if recipe.nil?

    RecipeSerializer.call(recipe).to_json
  end

  get '/recipes' do
    recipes = SpoonacularService.new.search_by_ids(params[:ids])

    return nil if recipes.nil?

    recipes.map { |recipe| RecipeSerializer.call(recipe) }.to_json
  end
end
