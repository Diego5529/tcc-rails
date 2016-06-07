class CreateUserCompanyTypes < ActiveRecord::Migration
  def change
    create_table :user_company_types do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :user_type
      t.boolean :active
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
