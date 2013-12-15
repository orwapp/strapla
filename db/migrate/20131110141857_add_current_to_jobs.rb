class AddCurrentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :current, :boolean
  end
end
