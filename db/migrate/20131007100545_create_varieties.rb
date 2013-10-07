class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
