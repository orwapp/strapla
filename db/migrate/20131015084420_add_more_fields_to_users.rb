class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_username, :string
    add_column :users, :describe_your_dream_project, :text
    add_column :users, :how_many_hours_to_you_typical_work_per_week, :integer
  end
end
