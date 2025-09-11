class AddConstraintsToAccommodations < ActiveRecord::Migration[8.0]
  def change
    change_column_null :accommodations, :name, false

    add_check_constraint :accommodations,
                         "length(details) >= 20",
                         name: "details_min_length_check"
  end
end
