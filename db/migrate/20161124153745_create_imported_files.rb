class CreateImportedFiles < ActiveRecord::Migration
  def change
    create_table :imported_files do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps null: false
    end
  end
end
