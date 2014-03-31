class CreateImages < ActiveRecord::Migration
  def change
    create_table :images, force: true do |t|
      t.timestamps
    end
  end

end
