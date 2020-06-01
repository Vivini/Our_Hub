class AddPrivateToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :private, :boolean
  end
end
