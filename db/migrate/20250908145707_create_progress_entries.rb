class CreateProgressEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :progress_entries do |t|
      t.references :student_goal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :recorded_on, null: false
      t.text :note
      t.string :evidence_url
      t.integer :score_numeric

      t.timestamps
    end
  end
end
