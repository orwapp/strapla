class AddRequestIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :request_id, :integer
  end
end
