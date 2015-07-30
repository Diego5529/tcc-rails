class AddColumnsToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :first_name, :string
    add_column :schools, :description, :string
    add_column :schools, :email, :string
    add_column :schools, :password_digest, :string
  end
end