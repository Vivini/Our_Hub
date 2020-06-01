class AddOrganizationCategoryToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization_category, :string
  end
end
