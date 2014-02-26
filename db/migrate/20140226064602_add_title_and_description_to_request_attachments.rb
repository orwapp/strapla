class AddTitleAndDescriptionToRequestAttachments < ActiveRecord::Migration
  def change
    add_column :request_attachments, :title, :string
    add_column :request_attachments, :description, :string
  end
end
