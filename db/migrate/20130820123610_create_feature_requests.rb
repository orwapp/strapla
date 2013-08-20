class CreateFeatureRequests < ActiveRecord::Migration
  def change
    create_table :feature_requests do |t|
      t.references :user, index: true
      t.text :user_story
      t.integer :priority
      t.references :request, index: true

      t.timestamps
    end
  end
end
