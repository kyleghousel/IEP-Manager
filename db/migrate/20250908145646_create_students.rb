class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :dob, null: false
      t.string :diagnosis, null: false
      t.string :grade_level

      t.timestamps
    end
  end
end
