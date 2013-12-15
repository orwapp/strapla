class AddStatusToPriceQuotes < ActiveRecord::Migration
  def change
    add_column :price_quotes, :status, :string
  end
end
