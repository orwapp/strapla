class RenameSubjectToTitleOnRequest < ActiveRecord::Migration
  def change
    rename_column :requests, :subject, :title
  end
end
