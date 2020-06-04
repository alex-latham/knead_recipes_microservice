class RecipeSerializer
  def self.call(recipe)
    { title: recipe[:title],
      id: recipe[:id],
      image: recipe[:image],
      time: recipe[:readyInMinutes],
      nutrition: format_nutrition(recipe[:nutrition][:nutrients]),
      ingredients: {
        ingredients: format_ingredients(recipe[:extendedIngredients]),
        missing_ingredients: recipe[:missedIngredientCount] },
      instructions: format_instructions(recipe[:analyzedInstructions][0]),
      summary: recipe[:summary],
      diets: recipe[:diets] }
  end

  def self.format_ingredients(ingredients)
    ingredients.reduce([]) do |acc, ingredient|
      acc << { detailed_name: ingredient[:originalString],
               name: ingredient[:name]}
    end
  end

  def self.format_nutrition(nutrients)
    nutrients.each_with_object({}) do |nutrient, acc|
      acc[nutrient[:title].downcase] = nutrient[:amount]
    end
  end

  def self.format_instructions(instructions)
    return if instructions.nil?
    instructions[:steps].reduce([]) do |acc, step|
      acc << { step[:number] => step[:step] }
    end
  end
end
