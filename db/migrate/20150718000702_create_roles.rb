class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.timestamps null: false
    end

    create_table :rights do |t|
      t.string :right_name
      t.timestamps null: false
    end

    create_table :rights_roles, id: false do |t|
      t.belongs_to :role, index: true
      t.belongs_to :right, index: true
    end

    create_table :roles_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true
    end
  end
end
