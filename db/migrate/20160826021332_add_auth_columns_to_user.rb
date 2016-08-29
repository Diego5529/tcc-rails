class AddAuthColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :active, :boolean
  end
end
