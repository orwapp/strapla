class AddRequestGroupIdToRequests < ActiveRecord::Migration
  def change
    rename_column :requests, :group_id, :request_group_id
  end
end
