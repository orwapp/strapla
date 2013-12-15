class RemoveRequestIdFromPreferredLanguages < ActiveRecord::Migration
  def change
    remove_column :preferred_languages, :request_id
  end
end
