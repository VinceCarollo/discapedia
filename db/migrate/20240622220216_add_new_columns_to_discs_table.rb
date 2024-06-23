class AddNewColumnsToDiscsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :discs, :category, :integer
    add_column :discs, :stability, :integer
    add_column :discs, :flight_chart_url, :string
  end
end
