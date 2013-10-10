class CreateEstimatedHours < ActiveRecord::Migration
  def change
    create_table :estimated_hours do |t|
      t.float :hours
      t.references :feature, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
