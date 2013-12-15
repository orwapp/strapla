class CreateBackgroundInformations < ActiveRecord::Migration
  def change
    create_table :background_informations do |t|
      t.text :elevator_pitch
      t.text :background_information
      t.text :no_list
      t.text :what_can_go_wrong
      t.text :what_is_it_going_to_give
      t.text :what_is_the_frame
      t.references :request, index: true

      t.timestamps
    end
  end
end
