class AddExpertInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :image_url, :string
    add_column :users, :title, :string
  end
end
