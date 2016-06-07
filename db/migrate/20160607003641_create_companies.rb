class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :description
      t.integer :min_users
      t.integer :max_users

      t.timestamps null: false
    end
  end
end
