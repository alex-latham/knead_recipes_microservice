class Recipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.bigint :recipe_id
      t.string :title
      t.string :image
      t.integer :time
      t.string :instructions
      t.string :nutriton
      t.string :ingredients
      t.timestamps
    end
  end
end
