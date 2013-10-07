class RemoveOldVarietyFromTeas < ActiveRecord::Migration
  def change
    remove_column :teas, :old_variety, :string
  end
end
