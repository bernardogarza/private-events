class ChangeNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :attendances, :attendee, :attendee_id 
    rename_column :attendances, :attended_event, :attended_event_id 
  end
end
