class CreateFeatureEstimations < ActiveRecord::Migration
  def change
    create_table :feature_estimations do |t|
      t.references :feature, index: true
      t.references :price_quote, index: true
      t.float :hours_estimated

      t.timestamps
    end
  end
end
