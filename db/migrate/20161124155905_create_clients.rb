class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :address
      t.string :postal_code
      t.string :country
      t.integer :age
      t.boolean :sex
      t.string :type

      t.timestamps null: false
    end
  end
end
