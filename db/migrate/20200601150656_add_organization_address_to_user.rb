class AddOrganizationAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization_address, :string
  end
end
