class CreateAccommodations < ActiveRecord::Migration[8.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :kind
      t.text :details

      t.timestamps
    end
  end
end
