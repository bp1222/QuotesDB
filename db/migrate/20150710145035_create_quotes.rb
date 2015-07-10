class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.string :attributed
      t.string :author
      t.integer :vote

      t.timestamps null: false
    end
  end
end
