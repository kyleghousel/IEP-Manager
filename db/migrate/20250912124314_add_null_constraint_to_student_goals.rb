class AddNullConstraintToStudentGoals < ActiveRecord::Migration[8.0]
  def change
    change_column_null :student_goals, :start_on, false
    change_column_null :student_goals, :target_date, false
    change_column_null :student_goals, :baseline, false
    change_column_null :student_goals, :target_value, false
    change_column_null :student_goals, :status, false
    change_column_null :student_goals, :mastery_percent, false
  end
end
