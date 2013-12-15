class CreateRequestGroupsUsers < ActiveRecord::Migration
  def change
    create_table :request_groups_users do |t|
      t.integer :user_id
      t.integer :request_group_id
    end
  end
end
