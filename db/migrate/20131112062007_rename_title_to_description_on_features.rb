class RenameTitleToDescriptionOnFeatures < ActiveRecord::Migration
  def change
    rename_column :features, :text, :description
  end
end
