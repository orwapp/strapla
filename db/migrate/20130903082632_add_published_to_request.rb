class AddPublishedToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :published, :boolean
  end
end
