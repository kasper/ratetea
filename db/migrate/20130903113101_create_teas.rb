class CreateTeas < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :name
      t.string :variety
      t.integer :brewery_id

      t.timestamps
    end
  end
end
