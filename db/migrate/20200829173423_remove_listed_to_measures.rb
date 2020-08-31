class RemoveListedToMeasures < ActiveRecord::Migration[6.0]
  def change
    remove_column :measures, :listed
  end
end
