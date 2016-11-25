class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.belongs_to :show, null: false
      t.string :name, null: false
      t.datetime :date, null: false
      t.datetime :end_date, null: false

      t.timestamps null: false
    end
  end
end
