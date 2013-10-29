class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills, force: true do |t|
      t.string :title

      t.timestamps
    end
  end
end
