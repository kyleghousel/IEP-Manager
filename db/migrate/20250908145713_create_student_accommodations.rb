class CreateStudentAccommodations < ActiveRecord::Migration[8.0]
  def change
    create_table :student_accommodations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true
      t.date :start_on
      t.date :end_on
      t.text :notes

      t.timestamps
    end
  end
end
