class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.boolean :account_verified, null: false, default: false
      t.string :auth_code
      t.string :password_digest
      
      t.timestamps null: false
    end
  end
end
