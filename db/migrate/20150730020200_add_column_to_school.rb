class AddColumnToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :archived, :boolean
  end
end