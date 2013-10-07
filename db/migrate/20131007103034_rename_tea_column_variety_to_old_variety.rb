class RenameTeaColumnVarietyToOldVariety < ActiveRecord::Migration

  def change

    rename_column :teas, :variety, :old_variety

  end

end
