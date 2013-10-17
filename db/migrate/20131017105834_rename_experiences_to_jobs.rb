class RenameExperiencesToJobs < ActiveRecord::Migration
  def change
		rename_table :experiences, :jobs
  end
end
