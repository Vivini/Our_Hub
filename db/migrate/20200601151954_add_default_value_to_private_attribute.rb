class AddDefaultValueToPrivateAttribute < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :private, :boolean, default: true
  end
end
