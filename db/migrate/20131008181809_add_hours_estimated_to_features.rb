class AddHoursEstimatedToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :hours_estimated, :float
  end
end
