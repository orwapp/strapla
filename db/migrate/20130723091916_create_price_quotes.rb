class CreatePriceQuotes < ActiveRecord::Migration
  def change
    create_table :price_quotes do |t|
      t.references :user, index: true
      t.references :request, index: true
      t.float :price
      t.float :hours_estimated

      t.timestamps
    end
  end
end
