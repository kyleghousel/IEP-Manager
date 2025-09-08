class AddRoleCheckConstraintToUsers < ActiveRecord::Migration[8.0]
  def change
    add_check_constraint :users,
                         "role IN ('parent','teacher','admin')",
                         name: "users_role_check"
  end
end
