class RemoveUnusedDiscColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :discs, :diameter, :float
    remove_column :discs, :height, :float
    remove_column :discs, :rim_depth, :float
    remove_column :discs, :rim_width, :float
    remove_column :discs, :buy_url, :string
  end
end
