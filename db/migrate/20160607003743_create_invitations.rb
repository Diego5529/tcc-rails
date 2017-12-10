class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :event_id
      t.integer :user_id
      t.integer :host_user_id
      t.integer :invitation_type_id
      t.integer :host_user_id

      t.timestamps null: false
    end
  end
end