class CreateElevatorPitches < ActiveRecord::Migration
  def change
    create_table :elevator_pitches do |t|
      t.text :text
      t.references :request, index: true

      t.timestamps
    end
  end
end
