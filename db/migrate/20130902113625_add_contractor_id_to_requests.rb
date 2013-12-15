class AddContractorIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :contractor_id, :integer
  end
end
