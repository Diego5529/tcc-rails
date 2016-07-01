class RenameColumnOnUserCompany < ActiveRecord::Migration
  def change
    rename_column :user_company_types, :user_type, :user_type_id
  end
end