class RemoveImageStringFromFeatures < ActiveRecord::Migration
  def change
    remove_column :features, :image
  end
end
