class AddFeatureIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :feature_id, :integer
  end
end
