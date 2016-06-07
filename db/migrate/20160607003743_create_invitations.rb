class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :invitation_type_id
      t.integer :guest_user

      t.timestamps null: false
    end
  end
end
