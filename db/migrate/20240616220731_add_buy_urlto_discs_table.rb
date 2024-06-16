class AddBuyUrltoDiscsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :discs, :buy_url, :string
  end
end
