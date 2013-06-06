class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :user
      t.references :repository
      t.integer :access
      t.timestamps
    end
    add_index :permissions, :user_id
    add_index :permissions, :repository_id
  end
end
