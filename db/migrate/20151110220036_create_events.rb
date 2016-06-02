class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.integer :city
      t.integer :state
      t.string :address
      t.string :number
      t.string :complement
      t.string :district
      t.string :zip_code
      t.date :initial_date
      t.date :end_date
      t.time :initial_hour
      t.time :end_hour
      t.string :status
      t.string :archived
      t.integer :min_user
      t.integer :max_user

      t.timestamps null: false
    end
  end
end
