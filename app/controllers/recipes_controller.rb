require './app/services/spoonacular_service'
require 'sinatra'

class RecipesController < Sinatra::Base

  get '/recipes/complexSearch' do
    SpoonacularService.new.complex_search(params).to_json
  end

  get "/recipe/:recipe_id" do
    SpoonacularService.new.search_by_id(params[:recipe_id]).to_json
  end

  get '/recipes' do
    SpoonacularService.new.search_by_ids(params[:ids]).to_json
  end
end
