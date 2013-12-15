class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :user, index: true
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
