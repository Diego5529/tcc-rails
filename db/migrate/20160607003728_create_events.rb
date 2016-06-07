class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :short_description
      t.text :long_description
      t.integer :city_id
      t.string :address
      t.string :address_complement
      t.string :number
      t.string :district
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.string :url_site
      t.string :facebook_page
      t.date :initial_date
      t.date :end_date
      t.time :initial_hour
      t.time :end_hour
      t.string :status
      t.text :note
      t.boolean :archive
      t.integer :event_type_id
      t.integer :event_category_id
      t.boolean :use_password
      t.string :password
      t.string :confirm_password
      t.integer :min_users
      t.integer :max_users
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
