class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :donation, null: false, foreign_key: true
      t.references :visit, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
