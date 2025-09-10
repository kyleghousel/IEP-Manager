class ChangeKindToAccommodationType < ActiveRecord::Migration[8.0]
  def change
    remove_column :accommodations, :kind, :string

    add_column :accommodations, :accommodation_type, :integer, null: false, default: 0
  end
end
