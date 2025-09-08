class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :objectives
      t.string :category
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
