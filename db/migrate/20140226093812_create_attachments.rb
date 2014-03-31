class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :request_id
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
