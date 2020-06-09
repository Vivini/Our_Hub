class AddTokenToVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :token, :string
  end
end
