class AddNatureToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :nature, :string
  end
end
