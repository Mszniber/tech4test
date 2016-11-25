class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.integer :age
      t.boolean :sex
      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
