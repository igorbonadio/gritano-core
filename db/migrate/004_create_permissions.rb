class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :contributor_id
      t.references :repository
      t.integer :access
      t.timestamps
    end
    add_index :permissions, :contributor_id
    add_index :permissions, :repository_id
  end
end
