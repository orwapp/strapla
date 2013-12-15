class AddPriceQuoteIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :price_quote_id, :integer
  end
end
