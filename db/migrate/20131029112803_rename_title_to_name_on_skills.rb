class RenameTitleToNameOnSkills < ActiveRecord::Migration
  def change
    rename_column :skills, :title, :name
  end
end
