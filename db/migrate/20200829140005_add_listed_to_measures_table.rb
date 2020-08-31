class AddListedToMeasuresTable < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :listed, :boolean
  end
end
