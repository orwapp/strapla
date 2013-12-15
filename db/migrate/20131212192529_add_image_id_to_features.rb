class AddImageIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :image_id, :integer
  end
end
