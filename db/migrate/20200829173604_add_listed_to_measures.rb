class AddListedToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :listed, :boolean, default: false
  end
end
