class CreateDonationCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :donation_categories do |t|
      t.references :donation
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
