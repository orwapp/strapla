class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :user, index: true
      t.string :title
      t.string :company
      t.date :from_datee
      t.date :to_date
      t.boolean :current_job
      t.string :summary

      t.timestamps
    end
  end
end
