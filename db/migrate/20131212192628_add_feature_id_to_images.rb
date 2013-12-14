class AddFeatureIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :feature_id, :integer
  end
end
