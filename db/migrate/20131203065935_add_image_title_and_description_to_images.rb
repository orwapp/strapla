class AddImageTitleAndDescriptionToImages < ActiveRecord::Migration
  def change
    add_column :images, :image, :string
    add_column :images, :title, :string
    add_column :images, :description, :text
  end
end
