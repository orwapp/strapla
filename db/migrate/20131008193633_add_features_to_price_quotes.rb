class AddFeaturesToPriceQuotes < ActiveRecord::Migration
  def change
    add_column :price_quotes, :features, :hstore
  end
end
