class AddOrganizationDescriptionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization_description, :text
  end
end
