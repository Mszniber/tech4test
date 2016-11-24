class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.belongs_to :show
      t.string :name
      t.datetime :date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
