class CreateEventInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :event_invitations do |t|
      t.integer :status, null: false
      t.references :invited_to_event, null: false, foreign_key: { to_table: :events }
      t.references :invited_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
