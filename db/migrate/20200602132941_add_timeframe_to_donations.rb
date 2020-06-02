class AddTimeframeToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :timeframe, :string
  end
end
