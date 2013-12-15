class CreateRequestGroups < ActiveRecord::Migration
  def change
    create_table :request_groups do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
