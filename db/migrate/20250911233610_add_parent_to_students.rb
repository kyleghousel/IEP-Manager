class AddParentToStudents < ActiveRecord::Migration[8.0]
  def change
    add_reference :students, :parent,
                  null: true,
                  foreign_key: { to_table: :users },
                  index: true
  end
end
