class RemoveFeatureEstimations < ActiveRecord::Migration
  def change
    drop_table :feature_estimations
  end
end
