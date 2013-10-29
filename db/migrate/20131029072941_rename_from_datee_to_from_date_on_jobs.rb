class RenameFromDateeToFromDateOnJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :from_datee, :from_date
  end
end
