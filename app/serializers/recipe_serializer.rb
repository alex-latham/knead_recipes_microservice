class RecipeSerializer
  def self.call(recipe)
    check_instructions(recipe)
    { title: recipe[:title],
      id: recipe[:id],
      image: recipe[:image],
      time: recipe[:readyInMinutes],
      nutrition: format_nutrition(recipe[:nutrition][:nutrients]),
      ingredients: {
        ingredients: format_ingredients(recipe[:extendedIngredients]),
        missing_ingredients: recipe[:missedIngredientCount] },
      instructions: format_instructions(recipe[:analyzedInstructions]),
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
    nutrients.reduce([]) do |acc, nutrient|
      acc << { nutrient[:title] => nutrient[:amount] }
    end
  end

  def self.format_instructions(instructions)
    return nil if instructions.nil?
    instructions[0][:steps].reduce([]) do |acc, step|
      acc << { step[:number] => step[:step] }
    end
  end

  def self.check_instructions(recipe)
    if recipe[:analyzedInstructions] == []
      recipe[:analyzedInstructions] = nil
    end
  end
end
