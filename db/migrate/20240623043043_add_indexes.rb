class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :manufacturers, :name, unique: true
    add_index :manufacturers, :slug, unique: true
    add_index :discs, [:slug, :manufacturer_id], unique: true
  end
end
