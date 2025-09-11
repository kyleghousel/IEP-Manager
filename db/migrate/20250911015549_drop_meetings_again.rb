class DropMeetingsAgain < ActiveRecord::Migration[8.0]
  def change
    drop_table :meetings, if_exists: true
  end
end
