class CreateStudentGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :student_goals do |t|
      t.references :student, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true
      t.date :start_on
      t.date :target_date
      t.string :baseline
      t.string :target_value
      t.string :status
      t.integer :mastery_percent

      t.timestamps
    end
  end
end
