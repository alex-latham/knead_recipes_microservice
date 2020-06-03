require 'fast_jsonapi'

class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :ingredients
end
