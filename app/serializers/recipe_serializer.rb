class RecipeSerializer
  incliude FastJsonapi::ObjectSerializer
  attributes :ingredients

  def ingredients
    require "pry"; binding.pry
  end
end
