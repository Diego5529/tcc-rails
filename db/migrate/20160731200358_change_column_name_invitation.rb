class ChangeColumnNameInvitation < ActiveRecord::Migration
  def change
    rename_column :invitations, :guest_user, :host_user_id
    rename_column :invitations, :user_id, :guest_user_id
  end
end