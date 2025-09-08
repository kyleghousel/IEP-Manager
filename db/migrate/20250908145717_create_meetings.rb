class CreateMeetings < ActiveRecord::Migration[8.0]
  def change
    create_table :meetings do |t|
      t.references :student, null: false, foreign_key: true
      t.references :organizer, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.datetime :scheduled_at, null: false
      t.string :meeting_type
      t.text :notes

      t.timestamps
    end
  end
end
