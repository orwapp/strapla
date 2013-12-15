class AddBackgroundInformationToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :elevator_pitch, :text
    add_column :requests, :background_information, :text
    add_column :requests, :no_list, :text
    add_column :requests, :what_can_go_wrong, :text
    add_column :requests, :what_is_it_going_to_give, :text
    add_column :requests, :what_is_the_frame, :text
  end
end
