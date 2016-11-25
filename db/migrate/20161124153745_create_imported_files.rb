class CreateImportedFiles < ActiveRecord::Migration
  def change
    create_table :imported_files do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
