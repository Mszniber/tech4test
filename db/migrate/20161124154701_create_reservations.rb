class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :imported_file
      t.belongs_to :ticket
      t.belongs_to :cart
      t.belongs_to :client
      t.datetime :date
      t.datetime :access_date
      t.string :seller

      t.timestamps null: false
    end
  end
end
