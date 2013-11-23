class SetDefaultStatusForRequests < ActiveRecord::Migration
  def change
    change_column :requests, :status, :string, default: :unpublished
  end
end
