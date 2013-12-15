class AddPreferredLanguageIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :preferred_language_id, :integer
  end
end
