class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :performance
      t.belongs_to :reservation
      t.string :serie
      t.string :floor
      t.string :product_type
      t.string :pricing, null: false
      t.float :price, null: false
      t.datetime :access_date

      t.timestamps null: false
    end
  end
end
