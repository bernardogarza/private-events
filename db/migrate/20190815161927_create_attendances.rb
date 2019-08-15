class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :attendee
      t.integer :attended_event

      t.timestamps
    end
  end
end