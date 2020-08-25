class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.string :alert

      t.timestamps
    end
  end
end
