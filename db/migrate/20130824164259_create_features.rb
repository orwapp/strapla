class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.references :request, index: true
      t.text :text
      t.string :title

      t.timestamps
    end
  end
end
