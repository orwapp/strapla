class AddDelegatedToUserIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :delegated_to_user_id, :integer
    remove_column :requests, :contractor_id
  end
end
