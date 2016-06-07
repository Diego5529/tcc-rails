class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :title
      t.string :short_description
      t.string :long_description

      t.timestamps null: false
    end
  end
end
