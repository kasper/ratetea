class CreateTeaClubs < ActiveRecord::Migration
  def change
    create_table :tea_clubs do |t|
      t.string :name
      t.integer :founded
      t.string :city

      t.timestamps
    end
  end
end
