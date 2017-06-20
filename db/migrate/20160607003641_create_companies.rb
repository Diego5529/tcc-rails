class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :short_description
      t.string :long_description
      t.integer :min_users
      t.integer :max_users

      t.timestamps null: false
    end
  end
end
