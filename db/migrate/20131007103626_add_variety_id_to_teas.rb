class AddVarietyIdToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :variety_id, :integer
  end
end
