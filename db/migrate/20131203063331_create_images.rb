class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.references :request, index: true

      t.timestamps
    end
  end
end
