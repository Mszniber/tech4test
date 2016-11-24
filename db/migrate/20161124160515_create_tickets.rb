class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :performance
      t.string :serie
      t.string :floor
      t.string :type
      t.string :pricing
      t.float :price

      t.timestamps null: false
    end
  end
end
