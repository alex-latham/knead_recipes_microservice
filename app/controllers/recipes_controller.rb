require './app/services/spoonacular_service'
require './app/serializers/recipe_serializer'
require 'sinatra'

class RecipesController < Sinatra::Base

  get '/recipes/complexSearch' do
    recipes = SpoonacularService.new.complex_search(params)
    recipes = recipes[:results].map { |recipe| RecipeSerializer.call(recipe) }.to_json
  end

  get "/recipe/:recipe_id" do
    recipe = SpoonacularService.new.search_by_id(params[:recipe_id])
    RecipeSerializer.call(recipe).to_json
  end

  get '/recipes' do
    recipes = SpoonacularService.new.search_by_ids(params[:ids])
    recipes.map { |recipe| RecipeSerializer.call(recipe) }.to_json
  end
end
