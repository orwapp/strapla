class CreatePreferredLanguages < ActiveRecord::Migration
  def change
    create_table :preferred_languages do |t|
      t.string :title
      t.references :request, index: true

      t.timestamps
    end
  end
end
