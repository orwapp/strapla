class AddImageUrlToRequestGroups < ActiveRecord::Migration
  def change
    add_column :request_groups, :image_url, :string
  end
end
