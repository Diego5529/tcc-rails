class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :place
      t.string :adress
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
