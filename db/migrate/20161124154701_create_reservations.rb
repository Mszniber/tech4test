class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :imported_file
      t.belongs_to :client
      t.datetime :date, null: false
      t.string :seller, null: false
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
