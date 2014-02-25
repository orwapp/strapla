class CreateRequestAttachments < ActiveRecord::Migration
  def change
    create_table :request_attachments do |t|
      t.references :request, index: true
      t.string :image

      t.timestamps
    end
  end
end
