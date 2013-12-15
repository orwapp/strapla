class AddFeatureIdToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :feature, index: true
  end
end
