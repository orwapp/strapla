class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :subject
      t.text :description
      t.text :goal
      t.references :group, index: true

      t.timestamps
    end
  end
end
