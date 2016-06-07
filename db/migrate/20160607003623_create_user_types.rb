class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :title
      t.string :short_description
      t.text :long_description

      t.timestamps null: false
    end
  end
end
