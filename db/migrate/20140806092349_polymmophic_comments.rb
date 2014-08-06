class PolymmophicComments < ActiveRecord::Migration
  def change
    create_table :comments, force: true do |t| 
      t.text :body
      t.integer :user_id 
      t.references :commentable, polymorphic: true
    end
  end
end
