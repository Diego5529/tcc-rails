class AddCollunmToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :long_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :genre, :string
    add_column :users, :phone_number, :string
  end
end
