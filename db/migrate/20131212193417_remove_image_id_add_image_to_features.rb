class RemoveImageIdAddImageToFeatures < ActiveRecord::Migration
  def change
    remove_column :features, :image_id
    add_column    :features, :image, :string
  end
end
