class AddOrganizationNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization_name, :string
  end
end
