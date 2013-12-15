class AddTypeOfToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :type_of, :string
  end
end
