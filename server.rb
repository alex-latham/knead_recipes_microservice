require 'sinatra'
# require 'sinatra/json'
require 'faraday'
require 'json'

get "/recipes/complexSearch" do
  def search_params
    {
      ingredients: params[:ingredients],
      time: params[:time].to_i,
      diet: params[:diet],
      type: params[:type],
    }
  end

  def complex_search(search_params)
    params = complex_search_params(search_params)
    get_json('/recipes/complexSearch', params)
  end

  def conn
    Faraday.new(url: 'https://api.spoonacular.com/')
  end

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def complex_search_params(search_params)
    {
      apiKey: '7606cb55e68b4954933da200621b6388',
      includeIngredients: search_params[:ingredients],
      maxReadyTime: search_params[:time],
      diet: search_params[:diet], type: search_params[:type],
      addRecipeInformation: true, fillIngredients: true, ignorePantry: true,
      minCalories: 0, minCholesterol: 0, minFat: 0, minProtein: 0, minCarbs: 0,
      minSugar: 0, minSodium: 0,
      number: 10, sort: 'random'
    }.compact
  end

  complex_search(search_params).to_json
end
