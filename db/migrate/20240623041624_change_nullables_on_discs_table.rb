class ChangeNullablesOnDiscsTable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :discs, :diameter, true
    change_column_null :discs, :height, true
    change_column_null :discs, :rim_depth, true
    change_column_null :discs, :rim_width, true
  end
end
