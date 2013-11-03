class AddDeveloperAndEmployerRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :developer, :boolean
    add_column :users, :employer, :boolean
  end
end
