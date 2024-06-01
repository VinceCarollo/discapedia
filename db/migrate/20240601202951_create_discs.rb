class CreateDiscs < ActiveRecord::Migration[7.1]
  def change
    create_table :discs do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.float :speed, null: false
      t.float :glide, null: false
      t.float :turn, null: false
      t.float :fade, null: false
      t.float :diameter, null: false
      t.float :height, null: false
      t.float :rim_depth, null: false
      t.float :rim_width, null: false

      t.timestamps
    end
  end
end
