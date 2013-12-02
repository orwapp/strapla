class AddSystemDescriptionToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :system_description, :text
  end
end
