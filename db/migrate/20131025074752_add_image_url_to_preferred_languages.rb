class AddImageUrlToPreferredLanguages < ActiveRecord::Migration
  def change
    add_column :preferred_languages, :image_url, :string
  end
end
